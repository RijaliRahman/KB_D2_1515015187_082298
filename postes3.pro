domains  %sebagai tempat pengenialisasi tipedata
matkul, nama, nilai = symbol %objek matkul,nama,nilai memiliki tipe data symbol

predicates %sebagai tempat pendeklarasian
nondeterm ambil(nama,matkul,nilai) %nondeterm artinya fkta ini memiliki lebih dari 1 kemungkinan, didalam fakta ambil ada nama,matkul,nilai.

clauses  %FAKTA                //ai = intelejensi buatan  so = Sistem Oprasi
ambil(irfan,ai,a).  %irfan mengmbil matakuliah ai dengan nilai a
ambil(komeng,ai,d). %komeng mengmbil matakuliah ai dengan nilai d
ambil(dati,ai,c). %dati mengmbil matakuliah ai dengan nilai c
ambil(fatima,ai,b). %fatima mengmbil matakuliah ai dengan nilai b
ambil(maspion,ai,c). %maspion mengmbil matakuliah ai dengan nilai c
ambil(ricky,pde,e). %ricky mengmbil matakuliah pde dengan nilai c
ambil(embang,pde,a). %embang mengmbil matakuliah pde dengan nilai a
ambil(salmin,pde,d). %salmin mengmbil matakuliah pde dengan nilai d
ambil(vina,pde,b). %vina mengmbil matakuliah pde dengan nilai b
ambil(sondang,pde,c). %sondang mengmbil matakuliah pde dengan nilai c
ambil(pamuji,so,d). %pamiju mengmbil matakuliah so dengan nilai d
ambil(luki,so,e). %luki mengmbil matakuliah so dengan nilai e
ambil(sadek,so,b). %sadek mengmbil matakuliah so dengan nilai b
ambil(yusida,so,a). %yusida mengmbil matakuliah so dengan nilai a
ambil(eka,so,a). %eka mengmbil matakuliah so dengan nilai a

goal %solusi yg mengambil informasi dari fakta2 di clauses
ambil(Nama,ai,_);nl, %akan menampilkan nama2 yang mengambil matakuliah ai
ambil(Tdklulus,_,d); ambil(Tdklulus,_,e);nl, %akan menampilkan nama2 yang tidak lulus dengan kondisi nilainya di bawah c yaitu d dan e
ambil(Lulus,_,a); ambil(Lulus,_,b);ambil(Lulus,_,c);nl, %akan menampilkan nama2 yang lulus dengan kondisi mendapatkan nilai a,b dan c
ambil(_,Matkul,_);nl, %akan menampilkan semya matkul
ambil(Nama,_,_). %akan menampilkan semua nama2 mahasiswa