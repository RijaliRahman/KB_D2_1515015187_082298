DOMAINS						%penginialisasi tipe data
nama,jender,pekerjaan,benda,alasan,zat = symbol %nama,jender,pekerjaan,benda,alasan,zat memiliki tipe data symbol
umur=integer					%umur memiliki tipe data integer

PREDICATES					%pendeklarasian    nondeterm=artinya fakta ini memiliki lebih dari satu kemungkinan
nondeterm orang(nama, umur, jender, pekerjaan)	%fakta orang memiliki nilai nama, umur, jender,pekerjaan
nondeterm selingkuh(nama, nama)			%fakta selingkuh memiliki 2 nilai nama, nama yang pertama orang yang selingkuh, nama kedua nama orang yang di selingkuhi
terbunuh_dengan(nama, benda)			%fakta terbunuh dengan memiliki nili nama pembunuh daan benda yang di gunakan untuk membunuh
terbunuh(nama)					%fakta terbunuh memiliki nilai nama orang yang terbunuh
nondeterm pembunuh(nama)			%fakta pembunuh memiliki nilai nama pembunuh
motif(alasan)					%fakta motif memiliki nilai alasan
ternodai(nama, zat)				%fakta ternodai memiliki nilai nama orang yang ternodai dan nilai zat yang menodai
milik(nama, benda)				%fakta milik berisi nilai nama pemilik dan benda yang dimiliki
nondeterm cara_kerja_mirip(benda, benda)	%fakta cara kerja memiliki 2 nilai benda, benda yang pertama benda yang dimiliki pelaku dan benda yang kedua adalah benda untuk membunuh
nondeterm kemungkinan_milik(nama, benda)	%fakta kemungkinan milik memiliki nilai nama orang yang mungki memiliki benda tersebut dan nilai benda 
nondeterm dicurigai(nama)			%fakta nama memiliki nilai nama yaitu nama yang di curugai jadi pelaku

/* * * Fakta-fakta tentang pembunuhan * * */
CLAUSES						%FAKTA
orang(budi,55,m,tukang_kayu).			%budi adalah orang yang berumur 55 tahun dengan jender laki2 dan memiliki perkerjaan tukang kayu
orang(aldi,25,m,pemain_sepak_bola). 		%aldi adalah orang yang berumur 25 tahun dengan jender laki2 dan memiliki perkerjaan pemain sepak bola
orang(aldi,25,m,tukang_jagal).			%aldi adalah orang yang berumur 25 tahun dengan jender laki2 dan memiliki perkerjaan tukang jagal
orang(joni,25,m,pencopet).			%joni adalah orang yang berumur 25 tahun dengan jender laki2 dan memiliki perkerjaan pencopet
 
selingkuh(ina,joni).				%ina selingkuh dengan joni
selingkuh(ina,budi).				%ina selingkuh dengan budi
selingkuh(siti,joni).				%siti selingkuh dengan joni	

terbunuh_dengan(siti,pentungan).		%siti terbunuh dengan pentungan

terbunuh(siti).					%siti terbunuh

motif(uang).					%uang adalah motof
motif(cemburu).					%cemburu adalah motif
motif(dendam).					%dendam adalah motof

ternodai(budi, darah).				%budi ternodai oleh darah
ternodai(siti, darah).				%siti ternodai oleh darah
ternodai(aldi, lumpur).				%aldi ernodai oleh lumpur
ternodai(joni, coklat).				%joni ternodai oleh coklat
ternodai(ina, coklat).				%ina ternodai oleh coklat

milik(budi,kaki_palsu).				%budi memiliki kaki palsu
milik(joni,pistol).				%joni memiliki pistol
/* * * Basis Pengetahuan * * */
cara_kerja_mirip(kaki_palsu, pentungan).	%kaki palsu memiliki cara kerja seperti pentungan
cara_kerja_mirip(balok, pentungan).		%balok memiliki cara kerja sepertipentungan
cara_kerja_mirip(gunting, pisau).		%gunting memiliki cara kerja seperti pisau
cara_kerja_mirip(sepatu_bola, pentungan).	%sepatu bola memiliki cara kerja seperti pentungan

kemungkinan_milik(X,sepatu_bola):-orang(X,_,_,pemain_sepak_bola).					%X kemungkinan memiliki sepatu bola jika si X ini adalah orang yang memiliki pekerjaan pemain sepak bola dan jika kita perhatikan di fakta di atas yang memiliki pekerjaan pemain sepak bola adalah adli
kemungkinan_milik(X,gunting):-orang(X,_,_,pekerja_salon).kemungkinan_milik(X,Benda):-milik(X,Benda).	%X kemungkinan memiliki gunting jika si X adalah orang yang memiliki pekerjaan salon dan kemungkinan memiliki sebuah benda dan jika kita perhatikan di fakta di atas si X ini tidak ad karna tidak ad yng bekerja di salon
/* * ** * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang      *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-terbunuh_dengan(siti,Senjata) ,cara_kerja_mirip(Benda,Senjata) ,kemungkinan_milik(X,Benda).	%si X dicurigai jika membunuh siti dengan senjata dan cara kerja senjata tersebut seperti benda  //jikasi X ini yang di curigai maka semua orang yang memiliki benda yang cara kerjanya mirip dengan senjta untuk membunuh siti
/* * * * * * * * * * * * * * * * * * * * * * * * * ** dicurigai laki-laki yang selingkuh dengan siti. ** * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-motif(cemburu),orang(X,_,m,_),selingkuh(siti,X).							%si X dicurigai jika memiliki motif cemburu dan seseorang dengan gender male(laki2) dan si X selingkuh dengan siti
/* * * * * * * * * * * * * * * * * * * * * * ** dicurigai perempuan yang selingkuh dengan ** laki-laki yang juga selingkuh dengan siti ** * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-motif(cemburu),orang(X,_,f,_),selingkuh(X,Lakilaki),selingkuh(siti,Lakilaki).			%si X dicurigai jika memiliki motif cemburu dengan seseorang female(perempuan) karna si X selingkuh dengan seorang laki2 dan si X yang selingkuh dengan laki2 tersebut adalah Siti
/* * * * * * * * * * * * * * * * * * * * * * * * * * ** dicurigai pencopet yang mempunyai motif uang.** * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-motif(uang),orang(X,_,_,pencopet).								%si X dicurigai karna memiliki motif uang dan dia adalah seorang pencopet

pembunuh(Pembunuh):-orang(Pembunuh,_,_,_),terbunuh(Terbunuh),Terbunuh <> Pembunuh, /* Bukan bunuh diri */dicurigai(Pembunuh),ternodai(Pembunuh,Zat),ternodai(Terbunuh,Zat). %pembunuh dikatakan pembunuh jika si orang itu adalah pembunuh dan si pembunuh telah membunuh seseorang sehingg ada yang terbunuh dan si pembunuh ini telah di curigai dan si pembunuh ini telah ternodai oleh sebuah zat  yang mana zat yang telah menodai si pembunuh juga telah menodai orang yang terbnuh

GOAL
pembunuh(X).	%pembunuhnya adalah budi karena udin adalah salah satu di antara orang yang di curigai dan kunci kenapa bisa budi pelaku pembunuhannya karna adalah sebuah zat yang menodai orang yang terbunuh dan noda tersebut juga telah menodai budi yaitu siti telah ternodai darah dan budi juga telah ternodai oleh darah