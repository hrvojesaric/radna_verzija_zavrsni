drop database if exists zavrsni_znl;
create database zavrsni_znl character set utf8 collate utf8_general_ci;
# mysql -uedunova -pedunova --default_character_set=utf8 < "E:\Javap\zavrsni\zavrsni_znl.sql" 
use zavrsni_znl;
create table igrac(
	sifra 		int not null primary key auto_increment,
	prezime varchar(100) not null,
	ime varchar(100) not null,
	broj_licence int not null,
	momcad int not null,
	datumrodenja datetime
	);
	
create table momcad(
	sifra 		int not null primary key auto_increment,
	naziv varchar(100) not null,
	predstavnik_kluba varchar(100),
	trener varchar(100),
	fizioterapeut varchar(100),
	stadion varchar(100) not null
	);
	
create table sudac(
	sifra 		int not null primary key auto_increment,
	prezime varchar(100) not null,
	ime varchar(100) not null,
	broj_licence int not null,
	datumrodenja datetime
	);
	
create table utakmica(
	sifra 		int not null primary key auto_increment,
	domaci int not null,
	gosti int not null,
	glavni_sudac int not null,
	prvi_pomocni int ,
	drugi_pomocni int ,
	pocetak datetime not null,
	rezultat varchar(20) not null
	);
	
create table dogadaj(
	sifra 		int not null primary key auto_increment,
	utakmica int not null,
	momcad int not null,
	opis varchar(200) not null,
	vrijeme int not null,
	vrstadogadaja int not null
	);
	
create table vrstadogadaja(
	sifra 		int not null primary key auto_increment,
	naziv varchar(50) not null
	);


alter table igrac add foreign key (momcad) references momcad(sifra);

alter table utakmica add foreign key (domaci) references momcad(sifra);
alter table utakmica add foreign key (gosti) references momcad(sifra);
alter table utakmica add foreign key (glavni_sudac) references sudac(sifra);
alter table utakmica add foreign key (prvi_pomocni) references sudac(sifra);
alter table utakmica add foreign key (drugi_pomocni) references sudac(sifra);

alter table dogadaj add foreign key (momcad) references momcad(sifra);
alter table dogadaj add foreign key (utakmica) references utakmica(sifra);
alter table dogadaj add foreign key (vrstadogadaja) references vrstadogadaja(sifra);

# 1-6
insert into vrstadogadaja (sifra,naziv) values
(null,'Pogodak'),
(null,'Autogol'),
(null,'Izmjena'),
(null,'Žuti karton'),
(null,'Crveni karton'),
(null,'Kazneni udarac');


# Momcadi 1-10
insert into momcad (sifra,naziv,predstavnik_kluba,trener,fizioterapeut,stadion) values
(null,'Nk "Sulkovci" Sulkovci','Dražen Majetić','Predrag Šarić','Hrvoje Ribić','Tribljavina'),
(null,'Nk "Sloga" Trenkovo',null,'Jurica Bešlić','Marijan Kovačević','Park'),
(null,'Nk "Dinamo" Rajsavac','Josip Glavaš','Slavko Pavlović','Ivan Madaj','RC'),
(null,'Nk "Hrvatski dragovoljac" Drenovac','Ranko Davidović','Željko Matijević',null,'Dom Hrvatskih vitezova'),
(null,'Nk "Graničar" Zagrađe','Karlo Srdarević','Josip Mijatović',null,'Glivnjak'),
(null,'Nk "Slaven" Gradac','Goran Pavlović','Goran Vrgoč',null,'Klasije'),
(null,'Nk "Parasan" Golobrdci',null,'Mihael Supan',null,'Pod selom'),
(null,'Nk "Dobrovac" Dobrovac',null,'Josip Tukara','Mario Gurdon','Dobrovac'),
(null,'Nk "Croatia" Donja Obrijež','Kristijan Marošević','Dražen Grlica','Dario Škariot','Igralište NK Croatia'),
(null,'Nk "Graničar" Bučje','Oliver Babić','Ivica Bajić','Stjepan Vračić','Graničar');

insert into igrac (sifra,prezime,ime,broj_licence,momcad,datumrodenja) values
#Igraci NK Sulkovci 1-18
(null,'Šarić','Hrvoje(V)',8500534,1,'1993-03-10'),
(null,'Majetić','Stjepan',8502617,1,'1996-12-02'),
(null,'Nović','Josip',8502623,1,'1997-03-19'),
(null,'Knezović','Josip',8502610,1,'1995-05-01'),
(null,'Majetić','Mato',8502545,1,'1991-06-29'),
(null,'Filipović','Ivan',8502611,1,'1993-04-03'),
(null,'Blašković','Dario',8500494,1,'1987-02-27'),
(null,'Vidmar','Dario',8502609,1,'1994-08-16'),
(null,'Prskalo','Ivan',8540734,1,'1993-06-01'),
(null,'Keč','Mihael',8500642,1,'1998-05-13'),
(null,'Milivojević','Nenad',8502571,1,'1981-10-02'),
(null,'Knezović','Matko(V)',8502633,1,'1997-04-04'),
(null,'Vidmar','Ivan',8502619,1,'1998-04-17'),
(null,'Vidakušić','Robert',8500478,1,'1983-08-25'),
(null,'Soldo','Josip',8500627,1,'1996-10-03'),
(null,'Šarić','Mario',8500657,1,'1996-07-13'),
(null,'Jovanović','Luka',8503464,1,'2000-10-30'),
(null,'Žalac','Ivica',8502563,1,'1992-01-10'),


#Igraci NK Sloga 19-36
(null,'Perić','Ante(V)',8502401,2,'1985-01-16'),
(null,'Antolović','Denis',8501471,2,'1987-01-15'),
(null,'Banović','Jure',8503930,2,'2000-01-30'),
(null,'Đaković','Matej',8504602,2,'1998-10-01'),
(null,'Čolić','Dario',8502291,2,'1992-07-29'),
(null,'Vranić','Dalibor',8502303,2,'1988-08-20'),
(null,'Mlinarić','Slavko',8503177,2,'1995-02-04'),
(null,'Markanović','Marko',8503041,2,'1996-08-11'),
(null,'Blašković','Marko',8500577,2,'1993-05-15'),
(null,'Banović','Luka',8503443,2,'1995-10-17'),
(null,'Bradić','Dražen',8500256,2,'1987-03-07'),
(null,'Pačić','Stjepan',8540068,2,'1998-12-02'),
(null,'Tomašević','Danijel',8503917,2,'2000-08-16'),
(null,'Drežnjak','Marko',8500271,2,'1987-09-01'),
(null,'Brekalo','Igor',8502754,2,'1988-12-21'),
(null,'Jozić','Mateo',8503440,2,'1997-08-19'),
(null,'Koutni','Alen',8502720,2,'1996-09-17'),
(null,'Filipović','Vjekoslav Maks',8503599,2,'2000-02-20'),


#Igraci NK Dinamo 37-51
(null,'Jovičić','Zoran(V)',8500291,3,'1985-05-14'),
(null,'Katić','Đuro',8500723,3,'1986-11-14'),
(null,'Čurčić','Danijel',8500709,3,'1983-03-19'),
(null,'Uldrijan','Ivan',8500798,3,'1998-12-14'),
(null,'Murar','Ivan',8501912,3,'1981-05-26'),
(null,'Blašković','Milan',8500741,3,'1983-04-08'),
(null,'Vukas','Dalibor',8500730,3,'1985-12-24'),
(null,'Triska','Ivan',8500743,3,'1990-05-07'),
(null,'Andrišek','Kristijan',8503444,3,'1994-01-28'),
(null,'Glavaš','Ivan',8540217,3,'1988-06-03'),
(null,'Jerković','Antonio',8503445,3,'2000-01-27'),
(null,'Blašković','Ivica',8500294,3,'1977-07-27'),
(null,'Čelić','Siniša',8540472,3,'1990-03-22'),
(null,'Mautner','Mario',8540434,3,'1992-12-23'),
(null,'Pečur','Petar',8501916,3,'1977-04-19'),

#Igraci NK Hrvatski dragovoljac 52-66
(null,'Gazilj','Ivan(V)',8500503,4,'1986-08-05'),
(null,'Garić','Matej',8504880,4,'2000-08-12'),
(null,'Ećimović','Tomislav',8501091,4,'1994-09-02'),
(null,'Skeledžija','Drago',8502215,4,'1978-03-10'),
(null,'Hećimović','Ivan',8501267,4,'1993-07-09'),
(null,'Karahmet','Mateo',8504105,4,'2000-09-12'),
(null,'Dražetić','Ante',8501068,4,'1978-09-05'),
(null,'Baketarić','Petar',8500099,4,'1991-03-26'),
(null,'Ilić','Josip',8501216,4,'1983-05-29'),
(null,'Kolomaz','Franjo',8500317,4,'1989-09-19'),
(null,'Nikolić','Pavo',8501193,4,'1997-12-18'),
(null,'Gugić','Boris',8503579,4,'2000-12-31'),
(null,'Davidović','Stjepan',8504110,4,'2002-05-28'),
(null,'Anđal','Damir',8503842,4,'1999-06-03'),
(null,'Belobrajdić','Luka',8501199,4,'1997-09-22'),

#Igraci NK GraničarZ 67-84
(null,'Bošnjak','Mateo(V)',8500634,5,'1998-08-27'),
(null,'Janković','Mateo',8540487,5,'2000-09-15'),
(null,'Lucić','Josip',8501077,5,'1994-07-30'),
(null,'Srdarević','Adam',8501023,5,'1992-12-25'),
(null,'Larma','Matej',8500578,5,'1991-11-19'),
(null,'Asančaić','Krunoslav',8501015,5,'1993-01-05'),
(null,'Jagodić','Željko',8502604,5,'1988-07-20'),
(null,'Turić','Željko',8501039,5,'1987-07-21'),
(null,'Valentić','Ante',8500531,5,'1991-06-21'),
(null,'Srdarević','Anto',8500049,5,'1986-07-29'),
(null,'Lulić','Antun',8501079,5,'1993-06-28'),
(null,'Uremović','Mato(V)',8504894,5,'2001-06-15'),
(null,'Čuljak','Franjo',8540728,5,'1990-11-21'),
(null,'Štimac','Mario',8540708,5,'1985-07-27'),
(null,'Šubara','Zvonimir',8500506,5,'1987-09-03'),
(null,'Ružičić','Josip',8504158,5,'2000-10-19'),
(null,'Lukačević','Robert',8540719,5,'2002-06-11'),
(null,'Rađenović','Domagoj',8504192,5,'1998-10-07'),

#Igraci NK Slaven 85-100
(null,'Klišanić','Filip(V)',8504404,6,'1999-08-26'),
(null,'Marinac','Božidar',8501160,6,'1987-06-23'),
(null,'Hip','Antonio',8503384,6,'1992-05-29'),
(null,'Peić','Andrej',8504295,6,'1999-04-27'),
(null,'Zeljko','Mihael',8501178,6,'1996-11-18'),
(null,'Mičević','Matej',8500608,6,'1995-12-21'),
(null,'Marović','Danijel',8501142,6,'1984-09-01'),
(null,'Pavić','Marko',8503487,6,'1998-08-15'),
(null,'Soldo','Antun',8500651,6,'1995-08-01'),
(null,'Veletić','Filip',8503523,6,'1999-08-09'),
(null,'Franjić','Mario',8501187,6,'1995-11-16'),
(null,'Puđ','Tomislav',8504333,6,'1999-04-29'),
(null,'Pavleka','Valentin',8504149,6,'1998-09-18'),
(null,'Marović','Kristijan',8504660,6,'1996-07-21'),
(null,'Kuprešak','Stjepan',8503220,6,'1996-01-05'),
(null,'Valenta','Josip',8500611,6,'1995-01-07'),

#Igraci NK Parasan 101-118
(null,'Supan','Blaž(V)',8502683,7,'1983-07-17'),
(null,'Franikić','Nikola',8540061,7,'1997-09-04'),
(null,'Legac','Ivan',8503310,7,'1988-03-27'),
(null,'Maričević','Vjekoslav',8502691,7,'1984-06-19'),
(null,'Mandić','Domagoj',8502669,7,'1991-09-02'),
(null,'Jurčić','Matko',8502730,7,'1994-12-06'),
(null,'Jurišić','Josip',8500324,7,'1989-03-21'),
(null,'Ivičić','Filip',8502789,7,'1990-04-26'),
(null,'Zdravković','Damjan',8502765,7,'1989-01-12'),
(null,'Ivanković','Matej',8502713,7,'1994-04-09'),
(null,'Cvitić','Josip',8502699,7,'1990-03-17'),
(null,'Smojvir','Antun',8502739,7,'1975-05-04'),
(null,'Hrmić','Tomislav',8540824,7,'1979-02-27'),
(null,'Turina','Stjepan',8502717,7,'1990-02-27'),
(null,'Kerner','Ivan',8502760,7,'1989-05-11'),
(null,'Marinović','Matej',8503504,7,'1995-06-20'),
(null,'Protić','Alen',8503131,7,'1993-01-12'),
(null,'Kajinić','Ivan',8502692,7,'1980-12-23'),

#Igraci NK Dobrovac 119-136
(null,'Darijo','Nagy(V)',7602435,8,'2000-04-29'),
(null,'Zec','Marko',7600318,8,'1994-02-15'),
(null,'Merkaš','Matej',7601703,8,'1998-07-16'),
(null,'Tutić','Božidar',7601686,8,'1995-10-16'),
(null,'Tutić','Valentino',7600427,8,'1990-12-12'),
(null,'Jakobi-Ivanović','Ivan',7600051,8,'1991-02-02'),
(null,'Jozić','Ante',7600225,8,'1986-11-25'),
(null,'Popović','Željko',7602308,8,'1997-04-07'),
(null,'Poletto','Siniša',7600419,8,'1992-10-18'),
(null,'Januš','Matija',7600249,8,'1990-07-04'),
(null,'Lujić','Josip',7600055,8,'1991-03-27'),
(null,'Galović','Vinko(V)',7602375,8,'2002-08-01'),
(null,'Galović','Stjepan',7602370,8,'1998-12-07'),
(null,'Tutić','Ivica',7600420,8,'1988-11-05'),
(null,'Šulc','Igor',7600342,8,'1989-02-24'),
(null,'Bićanić','Marijan',7600800,8,'1995-08-24'),
(null,'Meljankić','Anto',7600395,8,'1997-11-13'),
(null,'Kotorac','Darijo',7600791,8,'1991-09-15'),

#Igraci NK Croatia 137-154
(null,'Šperanca','Marino(V)',7601022,9,'1987-10-12'),
(null,'Sabo','Patrik',7601674,9,'1999-09-07'),
(null,'Giacometti','Marko',7600240,9,'1990-10-28'),
(null,'Čakarić','Darijo',7602100,9,'1996-12-16'),
(null,'Ajman','Mihael',7600376,9,'1996-09-04'),
(null,'Lenće','Alen',7602245,9,'1997-08-21'),
(null,'Jozipović','Antonio',7601010,9,'1995-10-09'),
(null,'Špelić','Petar',7601006,9,'1995-04-16'),
(null,'Burigo','Valentino',7601735,9,'1994-12-15'),
(null,'Lenće','Ivan',7602246,9,'1997-08-21'),
(null,'Savi','Tonći',7600448,9,'1990-09-20'),
(null,'Koči','Ivan',7602606,9,'1994-09-22'),
(null,'Andrijanić','Mihael',7601004,9,'1995-04-15'),
(null,'Jakša','Neven',7602243,9,'1981-12-15'),
(null,'Špelić','Matteo',7602239,9,'1998-07-31'),
(null,'Zubalj','Tomislav',7601021,9,'1982-10-06'),
(null,'Ajman','Marijan',7600367,9,'1994-08-18'),
(null,'Koči','Antonio',7602605,9,'1996-10-13'),

#Igraci NK Bučje 155-169
(null,'Lončarić','Dražen(V)',8540687,10,'1996-08-14'),
(null,'Vukelić','Josip',8504210,10,'1993-11-22'),
(null,'Putrić','Kristijan',8504573,10,'1998-02-20'),
(null,'Obućina','Anto',8540069,10,'1978-06-02'),
(null,'Obućina','Anto',8500485,10,'1997-01-25'),
(null,'Dukić','Matej',8504949,10,'2000-08-20'),
(null,'Dukić','Marko',8504095,10,'1988-04-12'),
(null,'Tomac','Marko',8540139,10,'1989-10-05'),
(null,'Brkić','Josip',8504113,10,'2000-02-21'),
(null,'Prša','Zvonimir',8501344,10,'1992-06-09'),
(null,'Katić','Vinko',8500655,10,'1999-07-01'),
(null,'Dukić','David(V)',8504861,10,'1998-09-26'),
(null,'Dunđer','Dino',8502962,10,'1992-03-29'),
(null,'Vukelić','Tihomir',8540738,10,'1968-10-27'),
(null,'Berić','Ivan',8501349,10,'1993-05-16');

#Sudac 1-59
insert into sudac(sifra,prezime,ime,broj_licence,datumrodenja) values
(null,'Abramović','Marko',84804493432,'1992-02-16'),
(null,'Abramović','Stjepan',20091024245,'1998-07-26'),
(null,'Adžijević','Mario',42316257894,'1984-01-11'),
(null,'Antolović','Zdenko',95095370698,'1966-09-16'),
(null,'Baltić','Josip',22166002600,'1972-09-15'),
(null,'Banović','Davor',94311562219,'1989-03-15'),
(null,'Banožić','Bruno',40589984959,'1994-09-10'),
(null,'Berger','Tomislav',75551684469,'1966-03-05'),
(null,'Bilmez','Ivan',99717127197,'1999-12-20'),
(null,'Blažević','Kruno',78573477425,'1991-11-10'),
(null,'Borevac','Mario',86151722497,'1982-10-08'),
(null,'Bošnjak','Goran',14607436387,'1975-12-28'),
(null,'Bošnjak','Siniša',11943969340,'1983-12-09'),
(null,'Brezicki','Jozo',33552351642,'1957-12-28'),
(null,'Brkić','Dario',35084731165,'1996-10-16'),
(null,'Ćuk','Ivan',00103045756,'1960-01-26'),
(null,'Dobraš','Alen',29373683216,'1987-03-12'),
(null,'Glavaš','Ivan',75950483481,'1988-06-03'),
(null,'Glavaš','Marko',95547230370,'1982-12-27'),
(null,'Grgić','Hrvoje',69880135433,'1985-10-19'),
(null,'Grgić','Marko',77287336596,'1990-01-28'),
(null,'Grgić','Matej',39314541481,'1997-04-30'),
(null,'Hrmić','Oliver',00368194540,'1982-08-07'),
(null,'Jakovljević','Domagoj',27114749334,'1992-03-10'),
(null,'Jelavić','Velimir',39582179431,'1982-10-03'),
(null,'Jurišić','Nikola',33283950872,'1988-01-01'),
(null,'Krtić','Goran',36014334161,'1970-10-23'),
(null,'Lucović','Andrija',85552084798,'1996-11-15'),
(null,'Mamić','Marin',30668973167,'1978-04-05'),
(null,'Marčinović','Petar',37885754252,'1996-05-14'),
(null,'Matijević','Jurica',87824348405,'1978-09-16'),
(null,'Matošević','Milan',99964910891,'1973-06-12'),
(null,'Mautner','Darko',11623254991,'1972-10-22'),
(null,'Mautner','Ivan',27151669060,'2000-06-24'),
(null,'Mihalj','Igor',36882964972,'1971-02-26'),
(null,'Mik','Valentino',81166667768,'1992-11-04'),
(null,'Novinc','Ivan',52876627810,'1996-09-26'),
(null,'Paun','Milan',63029403201,'1985-06-29'),
(null,'Pavličević','Jure',68439093155,'2000-10-28'),
(null,'Podobnik','Josip',68026965721,'1953-04-16'),
(null,'Poljaković','Ivica',26124320976,'1997-02-12'),
(null,'Rađenović','Danijel',06167297953,'1976-03-11'),
(null,'Relota','Denis',90813698883,'1988-06-02'),
(null,'Rezo','Rafael',31565414766,'1997-09-05'),
(null,'Ripić','Antonio',97368877840,'1995-06-13'),
(null,'Sabljak','Siniša',37874668996,'1972-03-10'),
(null,'Stojanović','Slaven',01662218431,'1971-04-10'),
(null,'Strnak','Gabrijel',05781541142,'2000-01-07'),
(null,'Supan','Ivan',99386082258,'1998-07-27'),
(null,'Šantić','Damir',66877827687,'1960-06-11'),
(null,'Šarić','Antonio',18789370539,'1995-05-02'),
(null,'Šinko','Jakov',06695455581,'2000-09-24'),
(null,'Širić','Antoni',29873577518,'1985-08-27'),
(null,'Šubara','Marko',90615987695,'1998-05-03'),
(null,'Tunjić','Grga',51405493139,'1990-05-12'),
(null,'Vidović','Ivica',33706605383,'1985-11-16'),
(null,'Vojtulek','Antun',02201588949,'1998-01-16'),
(null,'Vuković','Kristijan',28069299259,'2000-04-30'),
(null,'Zec','Oliver',43152592723,'1981-03-06');






