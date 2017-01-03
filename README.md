# Metoda k voditeljev z manhattansko razdaljo (k-median)

Avtor: Valentina Gnamuš

Projekt pri predmetu Operacijske raziskave v študijskem letu 2016/17.

## Opis problema
Metoda voditeljev (k-median) je eden najpogosteje proučevanih principov razvrščanja v skupine (slednji se namreč pojavljajo v mnogih različicah vključno s podatkovnim rudarjenjem in odkrivanjem znanja, podatkovno kompresijo in vektorsko kvantizacijo).
Pri metodah razvrščanja v skupine želimo objekte neke množice razvrstiti v skupine tako, da si bodo objekti znotraj posameznih skupin čimbolj podobni med seboj (glede na določeno lastnost) in objekti različnih skupin čimbolj različni med seboj. Gre za star problem, ki so ga poznali že stari Grki in ga rešujemo še danes.
 Problem razvrščanja v skupine so še nekaj desetletij nazaj reševali ločeno v posameznih znanstvenih disciplinah, ne da bi se tako dobljeni rezultati med seboj povezovali in dopolnjevali. V šestdesetih letih dvajsetega stoletja pa so se že pojavili prvi poskusi združitve različnih pristopov reševanja problema in v letu 1963 je nastalo prvo obsežnejše delo s tega področja, avtorjev Sokala in Sneatha. Od tedaj naprej se področje razvrščanja v skupine razvija kot samostojna disciplina znotraj multivariatne analize.
 
 Metoda voditeljev (k-median) sodi med nehierarhične metode razvrščanja, kar pomeni, da je treba vnaprej podati število skupin iskane razvrstitve (v našem primeru je to število t.i. *k*). Je iteracijska metoda, ki je zelo popularna, saj zmore v skupine razvrščati večje število enot. Postopek začnemo z vnaprej podano množico posameznih skupin - voditeljev. Metoda priredi dane objekte najbližjim voditeljem (tako, da je cena oziroma vsota oddaljenosti objektov do najbližjih voditeljev najmanjša). Nato metoda poišče težišča tako dobljenih skupin - nove voditelje in spet priredi enote najbližjim voditeljem. Ko se nova množice voditeljev ne razlikuje več od množice voditeljev, dobljene korak pred njo, se postopek zaključi.
 
## Osnovna shema metode voditeljev
 
 Definiramo začetno množico voditeljev: ```ruby 
 V = V(i)
ponavljaj
    določi razvrstitev *A* tako, da prirediš 
        vsako enoto njej najbližjemu voditelju
    za vsako skupino A(i) iz *A* izračunaj njeno središče A'(i)
        in ga določi za novega voditelja V(i) skupine A(i),
dokler se voditelji ne ustalijo```

Množica enot, ki jih razvrščamo, je končna, zato je končna tudi množica vseh razvrstitev. Tako tudi zgornji postopek sčasoma skonvergira v lokalno optimalno rešitev.

Za določanje začetne množice voditeljev poznamo različne načine. Najpogostejša in tudi najenostavnejša je slučajna določitev. Pogosto pa poskušamo število korakov v postopku zmanjšati tako, da voditelje maksimalno razpršimo med proučevanimi enotami; to
lahko storimo tako, da za prvega voditelja izberemo enoto, ki je v središču vseh enot, za vsakega naslednjega pa enoto, ki je najbolj oddaljena od vseh prejšnjih voditeljev. Najbolje pa je, da voditelje določimo na osnovi predhodno
opravljene analize podatkov in domnev o strukturi proučevanih
pojavov.


Za metodo voditeljev k-median, ki uporablja manhattansko razdaljo, je mogoče napisati celoštevilski linearni program, za katerega pa se izkaže, da v splošnem ne more biti efektivno rešljiv. Z relaksacijo ga lahko spremenimo v linearni program, ki pa je rešljiv v polinomskem času.

 V našem projektu bomo tako pokazali delovanje celoštevilskega linearnega programa na konkretnih podatkih, hkrati pa bomo rezultate primerjali z rešitvijo pri uporabi nekaterih implementiranih in hevrističnih algoritmov.
