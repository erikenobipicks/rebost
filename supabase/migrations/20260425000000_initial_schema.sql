-- ============================================================================
-- Rebost — Esquema complet de base de dades per Supabase
-- Executa aquest fitxer al SQL Editor (Dashboard → SQL Editor → New query → Run)
--
-- SEGUR DE REEXECUTAR: el bloc de neteja del principi esborra qualsevol estat
-- parcial abans de tornar-ho a crear tot des de zero. Útil si un intent previ
-- ha fallat a la meitat.
-- ============================================================================


-- 0. NETEJA (no fa res si no hi ha res) ---------------------------------------
drop trigger if exists on_auth_user_created on auth.users;
drop function if exists public.user_household() cascade;
drop function if exists public.handle_new_user() cascade;
drop function if exists public.generate_invite_code() cascade;
drop function if exists public.join_household_by_code(text) cascade;
drop table if exists cooking_history cascade;
drop table if exists shopping_state cascade;
drop table if exists meal_plans cascade;
drop table if exists recipes cascade;
drop table if exists family_members cascade;
drop table if exists profiles cascade;
drop table if exists households cascade;


-- 1. EXTENSIONS ---------------------------------------------------------------
create extension if not exists "uuid-ossp";


-- 2. TAULES -------------------------------------------------------------------

-- Nucli familiar compartit. Cada usuari pertany a un household.
create table households (
  id uuid primary key default uuid_generate_v4(),
  name text not null default 'La meva família',
  invite_code text unique,
  invite_expires_at timestamptz,
  created_at timestamptz default now()
);

-- Perfil vinculat a auth.users (gestionat per Supabase Auth)
create table profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  household_id uuid references households(id) on delete set null,
  display_name text,
  created_at timestamptz default now()
);

-- Membres de la família (no cal que siguin usuaris: infants, avis, etc.)
create table family_members (
  id uuid primary key default uuid_generate_v4(),
  household_id uuid not null references households(id) on delete cascade,
  nom text not null,
  edat text default 'adult' check (edat in ('adult','infant')),
  allergies jsonb default '[]'::jsonb,
  intolerancies jsonb default '[]'::jsonb,
  no_li_agrada jsonb default '[]'::jsonb,
  created_at timestamptz default now()
);
create index idx_family_members_household on family_members(household_id);

-- Receptes. household_id NULL = recepta global (les 18 precargades)
create table recipes (
  id uuid primary key default uuid_generate_v4(),
  household_id uuid references households(id) on delete cascade,
  nom text not null,
  temps int default 30,
  dificultat text default 'fàcil' check (dificultat in ('fàcil','mitja','difícil')),
  categoria jsonb default '["dinar","sopar"]'::jsonb,
  tags jsonb default '[]'::jsonb,
  racions int default 2,
  allergens jsonb default '[]'::jsonb,
  ingredients jsonb not null,
  passos jsonb not null,
  favorita boolean default false,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz default now()
);
create index idx_recipes_household on recipes(household_id);

-- Planning setmanal. Una fila per setmana.
create table meal_plans (
  id uuid primary key default uuid_generate_v4(),
  household_id uuid not null references households(id) on delete cascade,
  setmana_inici date not null,
  dies jsonb not null default '{}'::jsonb,
  -- { "Dilluns": {"esmorzar": null, "dinar": "recipe-uuid", "sopar": "recipe-uuid"}, ... }
  updated_at timestamptz default now(),
  unique(household_id, setmana_inici)
);
create index idx_meal_plans_household on meal_plans(household_id, setmana_inici desc);

-- Estat de la llista de la compra (què està marcat com a comprat)
create table shopping_state (
  household_id uuid primary key references households(id) on delete cascade,
  checked jsonb default '{}'::jsonb,
  updated_at timestamptz default now()
);

-- Històric de què s'ha cuinat
create table cooking_history (
  id uuid primary key default uuid_generate_v4(),
  household_id uuid not null references households(id) on delete cascade,
  recipe_id uuid references recipes(id) on delete set null,
  recipe_name text,
  cooked_at date default current_date,
  created_at timestamptz default now()
);
create index idx_cooking_history_household on cooking_history(household_id, cooked_at desc);


-- 3. HELPER: household de l'usuari actual -------------------------------------
-- IMPORTANT: al schema `public` perquè Supabase no permet crear objectes al
-- schema `auth` (està reservat per Supabase).

create or replace function public.user_household()
returns uuid
language sql stable security definer
set search_path = public
as $$
  select household_id from public.profiles where id = auth.uid() limit 1
$$;

grant execute on function public.user_household() to authenticated;


-- 4. ROW LEVEL SECURITY -------------------------------------------------------

alter table households       enable row level security;
alter table profiles         enable row level security;
alter table family_members   enable row level security;
alter table recipes          enable row level security;
alter table meal_plans       enable row level security;
alter table shopping_state   enable row level security;
alter table cooking_history  enable row level security;

-- Profiles: accés al propi perfil
create policy "profiles_self_select" on profiles for select using (auth.uid() = id);
create policy "profiles_self_insert" on profiles for insert with check (auth.uid() = id);
create policy "profiles_self_update" on profiles for update using (auth.uid() = id);

-- Households: accés al propi household
create policy "households_own_select" on households for select using (id = public.user_household());
create policy "households_own_update" on households for update using (id = public.user_household());
create policy "households_auth_insert" on households for insert with check (auth.uid() is not null);

-- Family members: accés al propi household
create policy "fm_household_all" on family_members for all
  using (household_id = public.user_household())
  with check (household_id = public.user_household());

-- Recipes: lectura de globals + propi household; escriptura només propi household
create policy "recipes_select" on recipes for select
  using (household_id is null or household_id = public.user_household());
create policy "recipes_insert" on recipes for insert
  with check (household_id = public.user_household());
create policy "recipes_update" on recipes for update
  using (household_id = public.user_household());
create policy "recipes_delete" on recipes for delete
  using (household_id = public.user_household());

-- Meal plans, shopping_state, cooking_history: propi household
create policy "mp_household_all" on meal_plans for all
  using (household_id = public.user_household())
  with check (household_id = public.user_household());
create policy "ss_household_all" on shopping_state for all
  using (household_id = public.user_household())
  with check (household_id = public.user_household());
create policy "ch_household_all" on cooking_history for all
  using (household_id = public.user_household())
  with check (household_id = public.user_household());


-- 5. TRIGGER: crear household automàticament quan es registra un usuari --------

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public
as $$
declare
  new_household_id uuid;
  user_name text;
begin
  user_name := coalesce(new.raw_user_meta_data->>'display_name', split_part(new.email, '@', 1));

  insert into households (name)
  values ('Família de ' || user_name)
  returning id into new_household_id;

  insert into profiles (id, household_id, display_name)
  values (new.id, new_household_id, user_name);

  insert into shopping_state (household_id) values (new_household_id);

  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();


-- 6. FUNCIÓ: generar codi d'invitació (7 dies de validesa) ---------------------

create or replace function public.generate_invite_code()
returns text language plpgsql security definer set search_path = public
as $$
declare
  code text;
  hh_id uuid;
begin
  hh_id := public.user_household();
  if hh_id is null then
    raise exception 'No pertanys a cap household';
  end if;

  code := upper(substring(md5(random()::text || clock_timestamp()::text) from 1 for 6));

  update households
  set invite_code = code, invite_expires_at = now() + interval '7 days'
  where id = hh_id;

  return code;
end;
$$;

grant execute on function public.generate_invite_code() to authenticated;


-- 7. FUNCIÓ: unir-se a un household amb codi d'invitació -----------------------

create or replace function public.join_household_by_code(code text)
returns uuid language plpgsql security definer set search_path = public
as $$
declare
  target_household_id uuid;
  old_household_id uuid;
begin
  select id into target_household_id
  from households
  where invite_code = upper(trim(code))
    and (invite_expires_at is null or invite_expires_at > now());

  if target_household_id is null then
    raise exception 'Codi d''invitació invàlid o caducat';
  end if;

  select household_id into old_household_id from profiles where id = auth.uid();

  update profiles set household_id = target_household_id where id = auth.uid();

  update households set invite_code = null, invite_expires_at = null where id = target_household_id;

  -- Neteja household antic si ha quedat buit
  if old_household_id is not null and old_household_id != target_household_id then
    delete from households
    where id = old_household_id
      and not exists (select 1 from profiles where household_id = old_household_id);
  end if;

  return target_household_id;
end;
$$;

grant execute on function public.join_household_by_code(text) to authenticated;


-- 8. REALTIME (sync en temps real per aquestes taules) ------------------------

alter publication supabase_realtime add table family_members;
alter publication supabase_realtime add table recipes;
alter publication supabase_realtime add table meal_plans;
alter publication supabase_realtime add table shopping_state;


-- ============================================================================
-- LLEST! Comprovació ràpida:
-- ============================================================================
-- select table_name from information_schema.tables
-- where table_schema = 'public' order by table_name;
--
-- Hauries de veure:
--   cooking_history, family_members, households, meal_plans,
--   profiles, recipes, shopping_state
-- ============================================================================
