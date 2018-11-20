drop database if exists zavrsni_znl;
create database zavrsni_znl character set utf8 collate utf8_general_ci;
# mysql -uedunova -pedunova --default_character_set=utf8 < "E:\Javap\skripte\zavrsni_znl.sql"
use zavrsni_znl;
create table liga(
	sifra 		int not null primary key auto_increment,
	naziv_lige varchar(100) not null,
	podrucni_nogometni_savez varchar(100) not null
	);

create table igrac(
	sifra 		int not null primary key auto_increment,
	ime varchar(100) not null,
	prezime varchar(100) not null,
	broj_licence int not null,
	momcad int,
	dob int
	);
	
create table momcad(
	sifra 		int not null primary key auto_increment,
	naziv varchar(100) not null,
	predstavnik_kluba varchar(100),
	trener varchar(100),
	fizioterapeut varchar(100),
	liga int not null,
	stadion varchar(100)
	);
	
create table sudac(
	sifra 		int not null primary key auto_increment,
	ime varchar(100) not null,
	prezime varchar(100) not null,
	broj_licence int not null,
	dob int
	);
	
create table utakmica(
	sifra 		int not null primary key auto_increment,
	domaci int not null,
	gosti int not null,
	glavni_sudac int not null,
	prvi_pomocni int ,
	drugi_pomocni int ,
	pocetak datetime not null
	);

alter table momcad add foreign key (liga) references liga(sifra);

alter table igrac add foreign key (momcad) references momcad(sifra);

alter table utakmica add foreign key (domaci) references momcad(sifra);
alter table utakmica add foreign key (gosti) references momcad(sifra);
alter table utakmica add foreign key (glavni_sudac) references sudac(sifra);
alter table utakmica add foreign key (prvi_pomocni) references sudac(sifra);
alter table utakmica add foreign key (drugi_pomocni) references sudac(sifra);

