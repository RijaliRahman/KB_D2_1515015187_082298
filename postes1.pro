predicates
cinta(symbol,symbol) - nondeterm(o,o)  %pridikat dari cinta itu adalah simbol, simbol sedangkan. nondeterm maksudnya adalah predikat ini memiliki lebih dari satu kemungkinan
cewek(symbol) - nondeterm (o) 	       %%pridikat dari cewek adalah simbol nondeterm maksudnya adalah predikat ini memiliki lebih dari satu kemungkinan
cowok(symbol) - nondeterm (o)		%pridikat dari cowok adalah simbol nondeterm maksudnya adalah predikat ini memiliki lebih dari satu kemungkinan
sayang(symbol,symbol) - nondeterm (i,i) %pridikat dari  itu adalah simbol, simbol sedangkan. nondeterm maksusnya adalah predikat ini memiliki lebih dari satu kemungkinan
menyukai(symbol) - (i)			%%pridikat dari menyukai itu adalah simbol, simbol sedangkan. nondeterm maksudnya adalah predikat ini memiliki lebih dari satu kemungkinan

clauses
cinta(X,Y):-cowok(X),cewek(Y),sayang(X,Y),menyukai(Y).  %ini adalah fakta yang akan menjadi goal yg memiliki cluu seperti di samping yaitu si X cinta Y jika X adalah cowok dan Y adalah cewek dan si X sayang si Y dan Y nebyukai

cowok(rijali). %rijali adalah cowok
cowok(rahman). % rahman adalah cowok

cewek(dian). %dian adalah cewek
cewek(siAS). %siAS adalah cewek

sayang(rijali, dian). %rijali sayang dian
sayang(rahman, siAS). %rijali sayang siAS

menyukai(dian). %dian menyukai

goal
cinta(Aku,Dia).  %goal ini adalah solusi dari cluu yang ada di atas dan hasilnya adalah Aku=rijali dan Dia=Dian jadi cara bacanya adalah rijali cinta dian