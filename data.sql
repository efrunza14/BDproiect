create table CLIENT(
    Nr_inregistrare number(5) primary key,
    Nume_client varchar2(20) not null,
    Prenume_client VARCHAR2(20) not null,
    CNP number(20) not null,
    Adresa varchar2(100) not null,
    Email varchar2(100) not null,
    Telefon number(10) not null,
    Puncte number(100),

    CONSTRAINT telefon_uk UNIQUE (Telefon),
    CONSTRAINT email_ck CHECK (regexp_like(Email, '[a-z0-9._%-]+@[a-z0-9._%-]+\.[a-z]{2,4}'))
);

create table PRODUS(
    ID_produs number(20) primary key,
    Denumire_produs varchar2(100) not null,
    An_produs number(5) not null,
    Puncte_produs number(2) not null,
    Pret_produs number(100) not null,
    Brand_produs varchar2(30) not null
);

create table RESTANTA(
     Nr_inregistrare number(5) ,
     ID_produs number(20),
     constraint INREGISTRARE_FK foreign key (Nr_inregistrare)references CLIENT(Nr_inregistrare),
     constraint ID_PROD foreign key (ID_produs) references PRODUS(ID_produs )
);

create table PROMOTIE (
     Nr_inregistrare number(5),
     Puncte number(5),
     Valoare_promotie number(5),
     constraint INR_FK foreign key (Nr_inregistrare) references CLIENT(Nr_inregistrare),
     CONSTRAINT emp_valoare_promotie_ck CHECK (Valoare_promotie>0)
);
alter table PROMOTIE add constraint UK_Nrinr unique (Nr_inregistrare);

desc CLIENT;
drop table CLIENT;
select * from CLIENT;

--inserari in tabela CLIENT

INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (5432, 'Prodan','Ana Maria', 6000211170071,' STR. Sfantu Lazar nr 1, IASI','prodananamaria@gmail.com',0754676541, 6000);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (6472, 'Arama','Iulian Constantin',1670120150038,'STR. B?RBOI nr. 8, IA?I','aramaiuly@gmail.com',0787652421,7800);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (8432, 'Dascalu','Amelia',6031229180045,'Strada Fratii Golesti, Arges','dascalum@gmail.com',0734447791,0);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (7432, 'LASCU','MIHAELA',2860206260027,'Bulevardul Lapus-Arges,Bl.71B, Ap.14','mihaelalascu@upt.ro',0778932589,605);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (9432, 'DUMBRAVA ','IONEL',2820821430063,'?OS.CHITILEI nr.115,BUCHAREST','idu33@outlook.com',0744676891,9568);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (8137, 'GOICEANU ','CRISTIAN',2540408260059,' Sat Mehedintia, Podenii Noi','cristig3@yahoo.com',0788932589,153);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (6532, 'GLIGA ','MARIAN RAZVAN',2261211520050,'Strada Libertatii Bl.2, Ap.13','MarianGliga@utiasi.ro',0734476541,4569);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (7431, 'PATRU','Alina',5090201270038,'Strada D.Filipescu 2,','patruali@gmail.com',0717387245,0);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (5130, 'PACURAR','CLAUDIA',2940501370077,'STR. HORIA nr. 94, DEVA','claudiaPacurar@utiasi.ro',0773711931,10000);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (6415, 'SANDU','Florin',2540815360047,'Strada Principala 59, Burjuc','sanduflorin@gmail.com',0793471035,453);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (8765, 'Lazar','Valentin',5070322100025,'STR. COLINEI nr. 77, PRAHOVA','lazarvali@gmail.com',0780220607,4698);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (9876, 'Jupca','Georgiana',1740204080030,'Strada V.Lucaciu 162','JupcaGeo@gmail.com',0700515370,0);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (5762, 'Bors','Nicoleta',2880804240084,'Strada Principala 200, Ilva Mica','nikobors@gmail.com',0784459844,798);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (1002, 'Rotariu','Irena', 2471029150063,'Strada Caraiman 2,','irenarotariu@gmail.com',0770224816,369);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (1003, 'Cocos','Marian',1950313350056,'STR.TRAIAN nr. 1, GORJ','cocosmarian@gmail.com',0747643851,4357);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (7871, 'Leonte','Danut',2830711340081,'Strada Bucegi 139, Luizi-Calugara','danutleo@gmail.com',0720421682,1599);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (9871, 'Strugaru','Maximilian',1960704420040,' Bulevardul Muncii Bl.1/42, Uricani','maxstrug@gmail.com',0733162030,6288);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (6543, 'Messi','Leo', 6091102120081,'BD. FERDINAND I nr. 101, BUCHAREST','leomessi@gmail.com',0732403991,7895);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (1712, 'Mbappe','Kyllian',1430113030044,'Strada I.C.Bratianu 112,Bucuresti','kmbappe@gmail.com',0721523821,2856);
INSERT INTO CLIENT(Nr_inregistrare,Nume_client,Prenume_client,CNP,Adresa,Email,Telefon,Puncte)
VALUES (8176, 'Ronaldo','Cristiano',2700728210039,'Strada Somesului 34,Cluj','ronaldocr@gmail.com',0740237234,5897);


desc PRODUS
drop table PRODUS;
select * from PRODUS;


--inserari in tabela PRODUS
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (101,'PRIMER',2023,50,100,'Milk');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (102,'FOND DE TEN',2022,100,250,'Sephora Collection');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (103,'CONCELEAR',2021,105,490,'Benefit');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (104,'CORECTOR',2023,200,400,'Maybelline');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (105,'SPRAY FIXARE',2024,60,125,'LOreal');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (106,'CONTUR',2020,500,650,'Catrice');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (107,'BLUSH',2019,59,980,'Elf');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (108,'CREION SPRANCENE',2023,785,123,'Essence');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (109,'CREION BUZE',2021,95,60,'Huda Beauty');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (110,'RUJ LICHID',2022,104,150,'Charlotte Tilbury');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (111,'GLOSS',2024,204,53,'Dior');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (112,'ILUMINATOR',2023,115,490,'MUP');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (113,'PARFUM DAMA',2020,114,1500,'Chanel');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (114,'PARFUM BARBATI',2019,225,1400,'Hugo Boss');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (115,'CREMA HIDRATARE',2024,64,890,'Sisley');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (116,'GEL CURATARE',2023,475,289,'Tatcha');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (117,'PENSULA FARD',2022,591,20,'Dermacol');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (118,'BURETE MACHIAJ',2021,42,70,'Beauty Blender');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (119,'PALETA FARD',2024,76,800,'Natasha Denona');
INSERT INTO PRODUS(ID_produs,Denumire_produs,An_produs,Puncte_produs,Pret_produs,Brand_produs)
VALUES (120,'GEL SPRANCENE',2022,310,39,'Refy');


desc RESTANTA;
drop table RESTANTA;
select * from RESTANTA;


INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(8765,116);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(6415,113);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(9432,103);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(7432,105);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(5762,107);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(1002,108);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(8432,109);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(7431,110);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(5432,106);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(6472,106);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(8765,103);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(6472,104);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(7431,106);
INSERT INTO RESTANTA(Nr_inregistrare,ID_produs)VALUES(9432,106);


desc PROMOTIE;
drop table PROMOTIE;
select * from PROMOTIE;



INSERT INTO PROMOTIE(Nr_inregistrare,Puncte,Valoare_promotie)VALUES(5130,1000,997);
INSERT INTO PROMOTIE(Nr_inregistrare,Puncte,Valoare_promotie)VALUES(9432,9568,980);
INSERT INTO PROMOTIE(Nr_inregistrare,Puncte,Valoare_promotie)VALUES(6543,7895,840);
INSERT INTO PROMOTIE(Nr_inregistrare,Puncte,Valoare_promotie)VALUES(6472,7800,790);
INSERT INTO PROMOTIE(Nr_inregistrare,Puncte,Valoare_promotie)VALUES(9871,6288,815);
INSERT INTO PROMOTIE(Nr_inregistrare,Puncte,Valoare_promotie)VALUES(5432,6000,705);
INSERT INTO PROMOTIE(Nr_inregistrare,Puncte,Valoare_promotie)VALUES(8176,5897,697);


