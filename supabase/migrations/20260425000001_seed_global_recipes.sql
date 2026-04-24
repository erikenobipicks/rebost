-- ============================================================================
-- Seed: 18 receptes globals (household_id = NULL) — placeholder
-- Visibles per a tots els households via la policy `recipes_select`.
-- Re-executable: esborra les globals existents abans d'inserir.
-- Format ingredients: [{"nom":"...","quantitat":N|null,"unitat":"..."}]
-- Format passos: ["text pas 1", "text pas 2", ...]
-- ============================================================================

delete from public.recipes where household_id is null;

insert into public.recipes
  (household_id, nom, temps, dificultat, categoria, tags, racions, allergens, ingredients, passos)
values

-- 1
(null, $$Truita de patates$$, 30, 'fàcil',
 $$["dinar","sopar"]$$::jsonb,
 $$["tradicional","vegetarià","ràpid"]$$::jsonb,
 4,
 $$["ou"]$$::jsonb,
 $$[
   {"nom":"patates","quantitat":500,"unitat":"g"},
   {"nom":"ous","quantitat":6,"unitat":"u"},
   {"nom":"ceba","quantitat":1,"unitat":"u"},
   {"nom":"oli d'oliva","quantitat":100,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Pelar les patates i tallar-les a làmines fines.",
   "Picar la ceba ben petita.",
   "Fregir patates i ceba a foc mitjà fins que estiguin tendres, sense daurar (uns 15 min).",
   "Escórrer bé l'oli i barrejar amb els ous batuts i sal al gust.",
   "Quallar a la paella per ambdues bandes fins quedar daurada per fora i melosa per dins."
 ]$$::jsonb),

-- 2
(null, $$Escudella i carn d'olla$$, 120, 'mitja',
 $$["dinar"]$$::jsonb,
 $$["tradicional","hivern","plat únic","contundent"]$$::jsonb,
 6,
 $$["gluten"]$$::jsonb,
 $$[
   {"nom":"pollastre","quantitat":500,"unitat":"g"},
   {"nom":"vedella per bullir","quantitat":300,"unitat":"g"},
   {"nom":"cansalada","quantitat":100,"unitat":"g"},
   {"nom":"botifarra negra","quantitat":1,"unitat":"u"},
   {"nom":"cigrons remullats","quantitat":200,"unitat":"g"},
   {"nom":"patates","quantitat":2,"unitat":"u"},
   {"nom":"pastanagues","quantitat":2,"unitat":"u"},
   {"nom":"api","quantitat":1,"unitat":"branca"},
   {"nom":"col","quantitat":0.25,"unitat":"u"},
   {"nom":"galets","quantitat":200,"unitat":"g"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Posar les carns a una olla gran amb 4 L d'aigua freda i sal.",
   "Quan arrenqui el bull, retirar l'escuma i afegir els cigrons.",
   "Coure tapat 1 hora a foc lent.",
   "Afegir les verdures pelades i tallades; coure 45 min més.",
   "Colar el caldo i bullir-hi els galets fins al punt (uns 10 min).",
   "Servir primer la sopa amb galets i després la carn d'olla amb les verdures."
 ]$$::jsonb),

-- 3
(null, $$Fideuà de marisc$$, 45, 'mitja',
 $$["dinar"]$$::jsonb,
 $$["marisc","festiu","mediterrània"]$$::jsonb,
 4,
 $$["gluten","crustacis","mol·luscs"]$$::jsonb,
 $$[
   {"nom":"fideus núm. 2","quantitat":400,"unitat":"g"},
   {"nom":"gambes","quantitat":12,"unitat":"u"},
   {"nom":"calamars nets","quantitat":200,"unitat":"g"},
   {"nom":"sípia","quantitat":200,"unitat":"g"},
   {"nom":"tomàquet ratllat","quantitat":200,"unitat":"g"},
   {"nom":"ceba","quantitat":1,"unitat":"u"},
   {"nom":"alls","quantitat":3,"unitat":"grans"},
   {"nom":"brou de peix","quantitat":1,"unitat":"L"},
   {"nom":"oli d'oliva","quantitat":50,"unitat":"ml"},
   {"nom":"safrà","quantitat":null,"unitat":"un pessic"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Sofregir la ceba i l'all picats a la paella amb oli.",
   "Afegir el tomàquet i deixar reduir uns 10 min.",
   "Incorporar calamars i sípia tallats; saltar 5 min.",
   "Afegir els fideus i daurar-los lleugerament barrejant.",
   "Mullar amb el brou de peix calent, posar safrà i sal.",
   "Coure 8 min, afegir les gambes i acabar 2 min més.",
   "Gratinar al forn 3 min fins que els fideus quedin drets."
 ]$$::jsonb),

-- 4
(null, $$Esqueixada de bacallà$$, 20, 'fàcil',
 $$["dinar","sopar"]$$::jsonb,
 $$["estiu","fred","sense cocció","peix","tradicional"]$$::jsonb,
 4,
 $$["peix"]$$::jsonb,
 $$[
   {"nom":"bacallà dessalat esqueixat","quantitat":400,"unitat":"g"},
   {"nom":"tomàquet madur","quantitat":3,"unitat":"u"},
   {"nom":"ceba tendra","quantitat":1,"unitat":"u"},
   {"nom":"olives negres","quantitat":100,"unitat":"g"},
   {"nom":"oli d'oliva verge","quantitat":50,"unitat":"ml"},
   {"nom":"vinagre","quantitat":null,"unitat":"un raig"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Esqueixar el bacallà ben dessalat amb les mans.",
   "Tallar el tomàquet a daus i la ceba en juliana fina.",
   "Barrejar bacallà, tomàquet, ceba i olives en una amanidera.",
   "Amanir amb oli, un raig de vinagre i rectificar de sal."
 ]$$::jsonb),

-- 5
(null, $$Canelons de carn$$, 90, 'difícil',
 $$["dinar","sopar"]$$::jsonb,
 $$["tradicional","festiu","Sant Esteve"]$$::jsonb,
 6,
 $$["gluten","lactosa","ou"]$$::jsonb,
 $$[
   {"nom":"plaques de canelons","quantitat":24,"unitat":"u"},
   {"nom":"carn picada de vedella","quantitat":400,"unitat":"g"},
   {"nom":"carn picada de porc","quantitat":200,"unitat":"g"},
   {"nom":"foie gras","quantitat":50,"unitat":"g"},
   {"nom":"ceba","quantitat":1,"unitat":"u"},
   {"nom":"llet","quantitat":500,"unitat":"ml"},
   {"nom":"mantega","quantitat":50,"unitat":"g"},
   {"nom":"farina","quantitat":50,"unitat":"g"},
   {"nom":"formatge ratllat","quantitat":100,"unitat":"g"},
   {"nom":"nou moscada","quantitat":null,"unitat":"un toc"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"},
   {"nom":"pebre","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Sofregir la ceba ben picada fins transparent.",
   "Afegir les dues carns picades i daurar-les ben fetes.",
   "Incorporar el foie i passar el conjunt per la picadora.",
   "Bullir les plaques de canelons segons paquet i estendre sobre un drap.",
   "Omplir amb la farsa, enrotllar i col·locar a la safata.",
   "Beixamel: fondre la mantega, afegir farina i coure 1 min, abocar la llet calenta i remenar fins espessir; sal, pebre i nou moscada.",
   "Cobrir els canelons amb la beixamel, espolsar formatge i gratinar 10 min a 200 °C."
 ]$$::jsonb),

-- 6
(null, $$Arròs amb conill i cargols$$, 60, 'mitja',
 $$["dinar"]$$::jsonb,
 $$["tradicional","paella","caça"]$$::jsonb,
 4,
 $$["mol·luscs"]$$::jsonb,
 $$[
   {"nom":"arròs bomba","quantitat":320,"unitat":"g"},
   {"nom":"conill trossejat","quantitat":1,"unitat":"kg"},
   {"nom":"cargols nets","quantitat":200,"unitat":"g"},
   {"nom":"tomàquet ratllat","quantitat":100,"unitat":"g"},
   {"nom":"alls","quantitat":4,"unitat":"grans"},
   {"nom":"romaní","quantitat":1,"unitat":"branca"},
   {"nom":"brou","quantitat":1,"unitat":"L"},
   {"nom":"oli d'oliva","quantitat":50,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Daurar el conill ben salpebrat a la paella amb oli.",
   "Afegir els alls picats i el tomàquet; sofregir 8 min.",
   "Incorporar l'arròs i sofregir 2 min remenant.",
   "Afegir els cargols i el romaní.",
   "Mullar amb el brou calent i coure 18 min sense remenar.",
   "Reposar 5 min tapat amb un drap abans de servir."
 ]$$::jsonb),

-- 7
(null, $$Pa amb tomàquet$$, 5, 'fàcil',
 $$["esmorzar","berenar","sopar"]$$::jsonb,
 $$["ràpid","tradicional","mediterrània","sense cocció"]$$::jsonb,
 2,
 $$["gluten"]$$::jsonb,
 $$[
   {"nom":"pa de pagès","quantitat":4,"unitat":"llesques"},
   {"nom":"tomàquet madur","quantitat":2,"unitat":"u"},
   {"nom":"all","quantitat":1,"unitat":"gra"},
   {"nom":"oli d'oliva verge extra","quantitat":null,"unitat":"un raig"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Torrar el pa fins quedar daurat.",
   "Si es vol, fregar la llesca amb un gra d'all pelat.",
   "Tallar el tomàquet per la meitat i fregar-lo bé per sobre el pa.",
   "Acabar amb un raig d'oli i una mica de sal."
 ]$$::jsonb),

-- 8
(null, $$Mongetes amb botifarra$$, 25, 'fàcil',
 $$["dinar","sopar"]$$::jsonb,
 $$["tradicional","ràpid","contundent"]$$::jsonb,
 4,
 $$[]$$::jsonb,
 $$[
   {"nom":"mongetes seques cuites","quantitat":500,"unitat":"g"},
   {"nom":"botifarres","quantitat":4,"unitat":"u"},
   {"nom":"alls","quantitat":2,"unitat":"grans"},
   {"nom":"julivert","quantitat":null,"unitat":"un manat"},
   {"nom":"oli d'oliva","quantitat":30,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Fer les botifarres a la paella amb una mica d'oli; reservar.",
   "En el mateix oli, sofregir l'all picat fins que comenci a daurar.",
   "Afegir les mongetes ja cuites i saltar 5 min remenant amb compte.",
   "Espolsar amb julivert picat i servir amb les botifarres al damunt."
 ]$$::jsonb),

-- 9
(null, $$Crema catalana$$, 30, 'mitja',
 $$["postres"]$$::jsonb,
 $$["tradicional","postres","dolç"]$$::jsonb,
 4,
 $$["lactosa","ou"]$$::jsonb,
 $$[
   {"nom":"llet","quantitat":1,"unitat":"L"},
   {"nom":"rovells d'ou","quantitat":8,"unitat":"u"},
   {"nom":"sucre","quantitat":200,"unitat":"g"},
   {"nom":"farina de blat de moro","quantitat":30,"unitat":"g"},
   {"nom":"pell de llimona","quantitat":1,"unitat":"u"},
   {"nom":"canyella en branca","quantitat":1,"unitat":"u"},
   {"nom":"sucre per cremar","quantitat":50,"unitat":"g"}
 ]$$::jsonb,
 $$[
   "Bullir la llet amb la pell de llimona i la canyella; deixar infusionar 10 min.",
   "Batre els rovells amb el sucre i la farina fins que blanquegin.",
   "Colar la llet calenta i abocar-la a poc a poc sobre els rovells, remenant.",
   "Tornar el conjunt al foc i coure a foc lent fins espessir, sense que bulli.",
   "Repartir en cassoletes i refrigerar mínim 2 h.",
   "Just abans de servir, espolsar sucre per sobre i cremar amb un bufador o pala calenta."
 ]$$::jsonb),

-- 10
(null, $$Calçots amb romesco$$, 45, 'fàcil',
 $$["dinar"]$$::jsonb,
 $$["tradicional","festiu","calçotada","mediterrània"]$$::jsonb,
 4,
 $$["fruits secs"]$$::jsonb,
 $$[
   {"nom":"calçots","quantitat":24,"unitat":"u"},
   {"nom":"ametlles torrades","quantitat":50,"unitat":"g"},
   {"nom":"avellanes torrades","quantitat":50,"unitat":"g"},
   {"nom":"tomàquet madur","quantitat":2,"unitat":"u"},
   {"nom":"alls escalivats","quantitat":4,"unitat":"u"},
   {"nom":"nyora","quantitat":1,"unitat":"u"},
   {"nom":"pa fregit","quantitat":1,"unitat":"llesca"},
   {"nom":"vinagre","quantitat":15,"unitat":"ml"},
   {"nom":"oli d'oliva","quantitat":150,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Torrar els calçots a la brasa fins que la capa exterior estigui ben negra.",
   "Embolicar-los en paper de diari i deixar reposar 10 min perquè acabin de coure.",
   "Per la salsa: hidratar la nyora i extreure'n la polpa.",
   "Triturar fruits secs, alls, tomàquet escalivat, polpa de nyora, pa i vinagre.",
   "Anar afegint l'oli a fil fins obtenir una crema; rectificar de sal.",
   "Servir els calçots calents per pelar i sucar a la salsa."
 ]$$::jsonb),

-- 11
(null, $$Suquet de peix$$, 50, 'mitja',
 $$["dinar","sopar"]$$::jsonb,
 $$["tradicional","mediterrània","peix"]$$::jsonb,
 4,
 $$["peix","fruits secs"]$$::jsonb,
 $$[
   {"nom":"rap o lluç","quantitat":800,"unitat":"g"},
   {"nom":"patates","quantitat":4,"unitat":"u"},
   {"nom":"ceba","quantitat":1,"unitat":"u"},
   {"nom":"alls","quantitat":3,"unitat":"grans"},
   {"nom":"tomàquet","quantitat":2,"unitat":"u"},
   {"nom":"ametlles torrades","quantitat":30,"unitat":"g"},
   {"nom":"brou de peix","quantitat":500,"unitat":"ml"},
   {"nom":"vi blanc","quantitat":100,"unitat":"ml"},
   {"nom":"julivert","quantitat":null,"unitat":"un manat"},
   {"nom":"oli d'oliva","quantitat":50,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Sofregir la ceba i 2 alls picats fins ben tendres.",
   "Afegir el tomàquet ratllat i coure fins reduir.",
   "Incorporar les patates trencades a daus i mullar amb brou i vi.",
   "Coure 15 min fins que les patates siguin gairebé tendres.",
   "Afegir el peix tallat en talls i coure 8 min més.",
   "Fer una picada amb les ametlles, l'all restant i el julivert; afegir-la al suquet i coure 2 min finals."
 ]$$::jsonb),

-- 12
(null, $$Espinacs a la catalana$$, 20, 'fàcil',
 $$["sopar"]$$::jsonb,
 $$["tradicional","saludable","vegetarià","mediterrània"]$$::jsonb,
 4,
 $$["fruits secs"]$$::jsonb,
 $$[
   {"nom":"espinacs frescos","quantitat":500,"unitat":"g"},
   {"nom":"panses","quantitat":50,"unitat":"g"},
   {"nom":"pinyons","quantitat":50,"unitat":"g"},
   {"nom":"alls","quantitat":2,"unitat":"grans"},
   {"nom":"oli d'oliva","quantitat":30,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Remullar les panses amb aigua tèbia 10 min i escórrer.",
   "Escaldar els espinacs en aigua bullint 1 min; escórrer i estrényer.",
   "Sofregir els alls laminats amb els pinyons fins daurats.",
   "Afegir panses i espinacs; saltar 3 min remenant.",
   "Rectificar de sal i servir."
 ]$$::jsonb),

-- 13
(null, $$Pollastre rostit amb prunes i pinyons$$, 70, 'mitja',
 $$["dinar","sopar"]$$::jsonb,
 $$["tradicional","festiu","agredolç"]$$::jsonb,
 4,
 $$["fruits secs","sulfits"]$$::jsonb,
 $$[
   {"nom":"pollastre tallat","quantitat":1.5,"unitat":"kg"},
   {"nom":"prunes seques sense pinyol","quantitat":12,"unitat":"u"},
   {"nom":"pinyons","quantitat":50,"unitat":"g"},
   {"nom":"cebes","quantitat":2,"unitat":"u"},
   {"nom":"vi ranci","quantitat":100,"unitat":"ml"},
   {"nom":"brou","quantitat":200,"unitat":"ml"},
   {"nom":"llorer","quantitat":2,"unitat":"fulles"},
   {"nom":"oli d'oliva","quantitat":40,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"},
   {"nom":"pebre","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Salpebrar el pollastre i daurar-lo a la cassola amb oli; reservar.",
   "Sofregir les cebes en juliana fins ben fondants.",
   "Afegir prunes i pinyons; saltar 1 min.",
   "Tornar el pollastre a la cassola, mullar amb vi i deixar reduir 2 min.",
   "Afegir el brou i les fulles de llorer; tapar i coure 35 min a foc lent."
 ]$$::jsonb),

-- 14
(null, $$Coca de recapte$$, 60, 'mitja',
 $$["dinar","berenar"]$$::jsonb,
 $$["tradicional","salada","forn"]$$::jsonb,
 6,
 $$["gluten","peix"]$$::jsonb,
 $$[
   {"nom":"massa de coca","quantitat":400,"unitat":"g"},
   {"nom":"pebrot vermell escalivat","quantitat":1,"unitat":"u"},
   {"nom":"albergínia escalivada","quantitat":1,"unitat":"u"},
   {"nom":"ceba escalivada","quantitat":1,"unitat":"u"},
   {"nom":"anxoves","quantitat":12,"unitat":"u"},
   {"nom":"oli d'oliva","quantitat":30,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Estendre la massa ben prima sobre paper de forn.",
   "Repartir-hi l'escalivada en tires i les anxoves.",
   "Regar amb un raig d'oli i una mica de sal.",
   "Coure al forn preescalfat a 200 °C uns 25 min, fins daurada per sota."
 ]$$::jsonb),

-- 15
(null, $$Bacallà amb samfaina$$, 50, 'mitja',
 $$["dinar","sopar"]$$::jsonb,
 $$["tradicional","peix","mediterrània"]$$::jsonb,
 4,
 $$["peix","gluten"]$$::jsonb,
 $$[
   {"nom":"bacallà dessalat","quantitat":4,"unitat":"talls"},
   {"nom":"albergínia","quantitat":1,"unitat":"u"},
   {"nom":"carbassó","quantitat":1,"unitat":"u"},
   {"nom":"pebrot vermell","quantitat":1,"unitat":"u"},
   {"nom":"ceba","quantitat":1,"unitat":"u"},
   {"nom":"tomàquets madurs","quantitat":3,"unitat":"u"},
   {"nom":"alls","quantitat":2,"unitat":"grans"},
   {"nom":"farina","quantitat":50,"unitat":"g"},
   {"nom":"oli d'oliva","quantitat":80,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Tallar totes les verdures a daus regulars.",
   "Sofregir ceba i alls; quan estiguin tendres, afegir pebrot.",
   "Incorporar albergínia i carbassó; coure 10 min.",
   "Afegir el tomàquet ratllat i coure tapat 15 min més.",
   "Enfarinar lleugerament el bacallà i daurar-lo a banda 2 min per banda.",
   "Posar el bacallà sobre la samfaina i coure 5 min finals."
 ]$$::jsonb),

-- 16
(null, $$Bunyols de bacallà$$, 40, 'mitja',
 $$["sopar","aperitiu"]$$::jsonb,
 $$["tradicional","fregit","peix","Quaresma"]$$::jsonb,
 4,
 $$["gluten","peix","ou","lactosa"]$$::jsonb,
 $$[
   {"nom":"bacallà dessalat esmicolat","quantitat":300,"unitat":"g"},
   {"nom":"farina","quantitat":200,"unitat":"g"},
   {"nom":"llet","quantitat":250,"unitat":"ml"},
   {"nom":"ous","quantitat":2,"unitat":"u"},
   {"nom":"llevat químic","quantitat":1,"unitat":"sobre"},
   {"nom":"alls","quantitat":2,"unitat":"grans"},
   {"nom":"julivert","quantitat":null,"unitat":"un manat"},
   {"nom":"oli per fregir","quantitat":500,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Barrejar farina, llet, ous i llevat fins obtenir una massa cremosa sense grumolls.",
   "Afegir el bacallà esmicolat, els alls picats i el julivert.",
   "Salar amb compte (el bacallà ja sala) i deixar reposar 30 min.",
   "Escalfar oli abundant a 180 °C.",
   "Anar fregint cullerades de massa fins quedar daurades i inflades.",
   "Escórrer sobre paper de cuina i servir calents."
 ]$$::jsonb),

-- 17
(null, $$Amanida catalana$$, 15, 'fàcil',
 $$["dinar","sopar"]$$::jsonb,
 $$["tradicional","fred","ràpid","contundent"]$$::jsonb,
 4,
 $$["ou","peix","lactosa"]$$::jsonb,
 $$[
   {"nom":"enciam","quantitat":1,"unitat":"u"},
   {"nom":"tomàquets","quantitat":2,"unitat":"u"},
   {"nom":"ceba","quantitat":0.5,"unitat":"u"},
   {"nom":"ous durs","quantitat":4,"unitat":"u"},
   {"nom":"tonyina en oli","quantitat":200,"unitat":"g"},
   {"nom":"olives","quantitat":100,"unitat":"g"},
   {"nom":"fuet","quantitat":100,"unitat":"g"},
   {"nom":"formatge tendre","quantitat":100,"unitat":"g"},
   {"nom":"oli d'oliva","quantitat":30,"unitat":"ml"},
   {"nom":"vinagre","quantitat":null,"unitat":"un raig"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Rentar i tallar l'enciam i posar-lo a la base de la safata.",
   "Repartir tomàquet a daus i ceba en juliana fina.",
   "Afegir els ous tallats a quarts, la tonyina i les olives.",
   "Posar fuet a rodanxes i el formatge a daus.",
   "Amanir amb oli, un raig de vinagre i sal."
 ]$$::jsonb),

-- 18
(null, $$Trinxat de la Cerdanya$$, 35, 'fàcil',
 $$["sopar"]$$::jsonb,
 $$["tradicional","muntanya","hivern","contundent"]$$::jsonb,
 4,
 $$[]$$::jsonb,
 $$[
   {"nom":"col d'hivern","quantitat":1,"unitat":"u"},
   {"nom":"patates","quantitat":4,"unitat":"u"},
   {"nom":"cansalada o panxeta","quantitat":200,"unitat":"g"},
   {"nom":"alls","quantitat":4,"unitat":"grans"},
   {"nom":"oli d'oliva","quantitat":40,"unitat":"ml"},
   {"nom":"sal","quantitat":null,"unitat":"al gust"}
 ]$$::jsonb,
 $$[
   "Bullir la col i les patates pelades fins ben tendres.",
   "Escórrer i aixafar amb forquilla fins barreja gruixuda.",
   "Tallar la cansalada a daus i fregir-la fins cruixent; reservar.",
   "En el mateix greix, daurar els alls laminats.",
   "Abocar la barreja de col i patata a la paella i premsar com una truita.",
   "Coure 5 min per banda fins crear crosta daurada.",
   "Servir amb la cansalada i alls al damunt."
 ]$$::jsonb);


-- ============================================================================
-- Comprovació: hauria de retornar 18
-- select count(*) from public.recipes where household_id is null;
-- ============================================================================
