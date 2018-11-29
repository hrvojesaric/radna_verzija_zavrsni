drop database if exists zavrsni_znl;
create database zavrsni_znl character set utf8 collate utf8_general_ci;
# mysql -uedunova -pedunova --default_character_set=utf8 < "E:\Javap\zavrsni\zavrsni_znl.sql" 
use zavrsni_znl;
create table igrac(
	sifra 		int not null primary key auto_increment,
	ime varchar(100) not null,
	prezime varchar(100) not null,
	broj_licence int not null,
	momcad int not null,
	datumrodenja datetime not null
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
	ime varchar(100) not null,
	prezime varchar(100) not null,
	broj_licence int not null,
	datumrodenja datetime not null
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
	naziv int not null
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
