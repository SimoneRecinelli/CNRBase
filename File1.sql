use cnrbase;
 create table Irbim (
     SedeAmm varchar(30) primary key,
     ParIVA char(11) not null,
     Figura varchar(30)
     );
drop table Irbim;

create table Fattura (
    NumOrd integer primary key,
    CostoTot numeric(8,2),
    QBarche smallint,
    Cedente varchar(30) not null,
    Cessionario varchar(40) not null
    );

drop table Fattura;


create table RDA(
    NumOrd integer primary key,
    CostoTot numeric(8,2),
    QBarche smallint
);

drop table RDA;

create table Contratto (
    NumOrd integer primary key,
    CostTot decimal(8,2),
    QBarche smallint,
    NomeDitta varchar(30),
    ParIVA char(11) not null
);

drop table Contratto;

create table TerzoIntermediario(
    NomeBanca varchar(30),
    Iban char(27),
    primary key(NomeBanca,Iban)
);

drop table TerzoIntermediario;

create table Domanda (
    NumOrd integer,
    CodFisc char(16),
    primary key (NumOrd,CodFisc)
);
 drop table Domanda;
create table Pescatore (
    CodFisc char(16) primary key,
    Iban char(27) not null,
    NomeP varchar(30),
    CognomeP varchar(30)
);

drop table Domanda;

create table Progetto (
    CodProg integer primary key,
    Budget decimal(8,2) not null
);
drop table Progetto;

create table Partecipazione(
    CodProg integer,
    CodFisc char(16),
    primary key(CodProg,CodFisc)
);

drop table Partecipazione;

create table Ricercatore(
    CodFisc char(16) primary key,
    NomeR varchar(30),
    CognomeR varchar(30)
);

drop table Ricercatore;

create table Possesso(
     IdBarca varchar(8),
     CodFisc char(16),
     primary key(IdBarca,CodFisc)
);
drop table Possesso;

create table OperazioneDiPesca(
    IdOp integer primary key,
    GSA smallint,
    TipoOss char(1),
    LatI varchar(15),
    LatF varchar(15),
    LongI varchar(15),
    LongF varchar(15),
    Qbarche smallint,
    data date
);
drop table OperazioneDiPesca;

create table Utilizzo(
    IdBarca varchar(8),
    IdOp integer,
    primary key(IdBarca,IdOp)
);
drop table Utilizzo;

create table Cattura(
    IdOp integer,
    IdPesce integer,
    primary key(IdOp,IdPesce)
);
drop table Cattura;

create table Imbarcazione (
    IdBarca varchar(8) primary key,
    Attrezzo varchar(30),
    LFT decimal(4,2),
    PortoP varchar(20),
    PortoA varchar(20)
);
drop table Imbarcazione;

create table UscitaPescatore (
    CodFisc char(16) primary key,
    IdOp integer not null
);
drop table UscitaPescatore;

create table UscitaRicercatore (
    CodFisc char(16) primary key,
    IdOp integer not null
);
drop table UscitaRicercatore;

create table AnimalePescato (
    IdPesce integer primary key,
    Nome varchar(20),
    CatComm varchar(20),
    Sesso varchar(1),
    Lunghezza decimal (5,2),
    Peso decimal (5,3),
    StadioMat varchar(2)
);
drop table AnimalePescato;
show tables;

insert into Irbim (SedeAmm, ParIVA, Figura) values ('Ancona', 21145647324, 'Amministratore');
insert into Irbim (SedeAmm, ParIVA, Figura) values ('Mazara Del Vallo', 34528374621, 'Amministratore');
insert into Irbim (SedeAmm, ParIVA, Figura) values ('Lesina', 98726327436, 'Amministratore');

insert into RDA (NumOrd, CostoTot, QBarche) values (1589, 1502.00, 10);
insert into RDA (NumOrd, CostoTot, QBarche) values (1385, 2300.00, 15);
insert into RDA (NumOrd, CostoTot, QBarche) values (4857, 1260.00, 8);
insert into RDA (NumOrd, CostoTot, QBarche) values (3034, 3000.00, 20);
insert into RDA (NumOrd, CostoTot, QBarche) values (4372, 6704.00, 40);
insert into RDA (NumOrd, CostoTot, QBarche) values (509, 1198.00, 7);
insert into RDA (NumOrd, CostoTot, QBarche) values (102, 5400.00, 35);
insert into RDA (NumOrd, CostoTot, QBarche) values (8743, 3489.00, 23);

insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario) values (1589,1502.00, 10,'CASSA DI RISPARMIO DI FERMO','CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario) values (1385,2300.00, 15,'CASSA DI RISPARMIO DI OSIMO','CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario) values (4857,1260.00, 8,'CASSA DI RISPARMIO DI MACERATA','CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario) values (3034,3000.00, 20,'CASSA DI RISPARMIO DI FERMO','CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario) values (4372,6704.00, 40,'CASSA DI RISPARMIO DI MACERATA','CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario) values (509,1198.00, 7,'CASSA DI RISPARMIO DI FERMO','CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario) values (102,5400.00, 35,'CASSA DI RISPARMIO DI OSIMO','CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario) values (8743,3489.00, 23,'CASSA DI RISPARMIO DI MACERATA','CNR ISTITUTO RISORSE BIOLOGICHE');

insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA) values (1589,1502.00, 10, 'F.lli Gianni Pesca SPA', 50982900529);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA) values (1385,2300.00, 15, 'Cuore ittico SAS', 60888610627);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA) values (4857,1260.00, 8, 'Emporio del Marinaio SPA', 74936370159);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA) values (3034,3000.00, 20, 'F.lli Gianni Pesca SAS', 50982900529);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA) values (4372,6704.00, 40, 'Cuore ittico SAS', 60888610627);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA) values (509,1198.00, 7, 'F.lli Gianni Pesca SPA', 50982900529);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA) values (102,5400.00, 35, 'Cuore ittico SAS', 60888610627);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA) values (8743,3489.00, 23, 'Emporio del Marinaio SPA', 74936370159);

insert into Progetto (CodProg, Budget) values (1021,023670.00);
insert into Progetto (CodProg, Budget) values (874,018842.00);
insert into Progetto (CodProg, Budget) values (2641,061025.00);
insert into Progetto (CodProg, Budget) values (622,112300.00);

insert into Pescatore(CodFisc, Iban, NomeP, CognomeP) values ('RSSGLN88C12G631L','IT16B0300203280654193989541','Giuliano','Rossi');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP) values ('VRDFRC72E26D145W','IT70J0300203280943618364116','Francesco','Verdi');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP) values ('ZMPMRC76A08G439W','IT50Z0300203280882854883384','Marco','Zampa');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP) values ('DCCMRT89F10K212L','IT85X0300203280325219582297','Marta','De Cecco');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP) values ('BNCDBR81I03D110W','IT47S0300203280992657365563','Debora','Bianchi');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP) values ('SRGRRT90L01I607X','IT19R0300203280396558915351','Roberto','Soraggi');

insert into Ricercatore(CodFisc, NomeR, CognomeR) values ('CPPFNC69T09F315F', 'Franco','Ceppi');
insert into Ricercatore(CodFisc, NomeR, CognomeR) values ('CHLGCM73L01E388X', 'Giacomo','Chiola');
insert into Ricercatore(CodFisc, NomeR, CognomeR) values ('PNTLSS80B28E388T', 'Alessia','Pantani');
insert into Ricercatore(CodFisc, NomeR, CognomeR) values ('RVRVSS63R41G185P', 'Vanessa','Raverta');
insert into Ricercatore(CodFisc, NomeR, CognomeR) values ('CLLGPP84L01D696J', 'Giuseppe','Cilli');
insert into Ricercatore(CodFisc, NomeR, CognomeR) values ('GVNNGL90T30C252V', 'Angelo','Giovannetti');
insert into Ricercatore(CodFisc, NomeR, CognomeR) values ('CRDCCL85A41F789X', 'Cecilia','Caredio');


insert into Partecipazione(CodProg, CodFisc) values (1021,'PNTLSS80B28E388T');
insert into Partecipazione(CodProg, CodFisc) values (1021,'CHLGCM73L01E388X');
insert into Partecipazione(CodProg, CodFisc) values (2641,'CLLGPP84L01D696J');
insert into Partecipazione(CodProg, CodFisc) values (622,'RVRVSS63R41G185P');
insert into Partecipazione(CodProg, CodFisc) values (622,'CPPFNC69T09F315F');
insert into Partecipazione(CodProg, CodFisc) values (874,'GVNNGL90T30C252V');
insert into Partecipazione(CodProg, CodFisc) values (874,'CRDCCL85A41F789X');
insert into Partecipazione(CodProg, CodFisc) values (1021,'GVNNGL90T30C252V');

insert into Domanda(NumOrd, CodFisc) values (1589,'CPPFNC69T09F315F');
insert into Domanda(NumOrd, CodFisc) values (1385,'CHLGCM73L01E388X');
insert into Domanda(NumOrd, CodFisc) values (4857,'PNTLSS80B28E388T');
insert into Domanda(NumOrd, CodFisc) values (3034,'RVRVSS63R41G185P');
insert into Domanda(NumOrd, CodFisc) values (4372,'CLLGPP84L01D696J');
insert into Domanda(NumOrd, CodFisc) values (509,'GVNNGL90T30C252V');
insert into Domanda(NumOrd, CodFisc) values (102,'CRDCCL85A41F789X');
insert into Domanda(NumOrd, CodFisc) values (8743,'CLLGPP84L01D696J');

insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA) values ('AL635','Palamito fisso', 06.30, 'Ancona', 'Ancona');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA) values ('GS870','Lenza a mano ', 05.80, 'Pescara', 'Pescara');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA) values ('ZC112','Draga automatica', 07.10, 'Ancona', 'Ancona');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA) values ('CD902','Reti a strascico', 06.00, 'Ancona', 'Ancona');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA) values ('AZ205','Palamito fisso', 06.90, 'Bari', 'Bari');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA) values ('FH448','Draga a mano', 07.40, 'Ancona', 'Ancona');

insert into Possesso(IdBarca, CodFisc) values ('AL635','RSSGLN88C12G631L');
insert into Possesso(IdBarca, CodFisc) values ('AL635','VRDFRC72E26D145W');
insert into Possesso(IdBarca, CodFisc) values ('GS870','ZMPMRC76A08G439W');
insert into Possesso(IdBarca, CodFisc) values ('ZC112','DCCMRT89F10K212L');
insert into Possesso(IdBarca, CodFisc) values ('CD902','BNCDBR81I03D110W');
insert into Possesso(IdBarca, CodFisc) values ('AZ205','SRGRRT90L01I607X');
insert into Possesso(IdBarca, CodFisc) values ('FH448','SRGRRT90L01I607X');

insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data) values (1,17,'S','43° 00 00 N', '42° 51 00 N', '14° 56 00 E', '15° 16 00 E', 1, '2021-08-17');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data) values (2,17,'N','45° 10 00 N', '45° 16 00 N', '12° 32 00 E', '12° 21 00 E', 2, '2021-09-03');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data) values (3,18,'N','43° 00 00 N', '42° 51 00 N', '14° 56 00 E', '15° 16 00 E', 2, '2021-09-13');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data) values (4,18,'S','44° 00 00 N', '44° 07 00 N', '13° 38 50 E', '13° 50 00 E', 1, '2021-09-27');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data) values (5,17,'S','45° 10 00 N', '45° 16 00 N', '12° 32 00 E', '12° 21 00 E', 1, '2021-10-05');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data) values (6,18,'S','44° 00 00 N', '44° 07 00 N', '13° 38 50 E', '13° 50 00 E', 2, '2021-10-14');

insert into UscitaPescatore(CodFisc, IdOp) values ('RSSGLN88C12G631L',1);
insert into UscitaPescatore(CodFisc, IdOp) values ('VRDFRC72E26D145W',1);
insert into UscitaPescatore(CodFisc, IdOp) values ('ZMPMRC76A08G439W',2);
insert into UscitaPescatore(CodFisc, IdOp) values ('DCCMRT89F10K212L',2);
insert into UscitaPescatore(CodFisc, IdOp) values ('BNCDBR81I03D110W',3);
insert into UscitaPescatore(CodFisc, IdOp) values ('CLLGPP84L01D696J',4);
insert into UscitaPescatore(CodFisc, IdOp) values ('PNTLSS80B28E388T',5);
insert into UscitaPescatore(CodFisc, IdOp) values ('ZMPMRC76A08G439W',6);

insert into UscitaRicercatore(CodFisc, IdOp) values ('CPPFNC69T09F315F',1);
insert into UscitaRicercatore(CodFisc, IdOp) values ('CHLGCM73L01E388X',2);
insert into UscitaRicercatore(CodFisc, IdOp) values ('PNTLSS80B28E388T',2);
insert into UscitaRicercatore(CodFisc, IdOp) values ('RVRVSS63R41G185P',3);
insert into UscitaRicercatore(CodFisc, IdOp) values ('ZMPMRC76A08G439W',4);
insert into UscitaRicercatore(CodFisc, IdOp) values ('GVNNGL90T30C252V',5);
insert into UscitaRicercatore(CodFisc, IdOp) values ('RVRVSS63R41G185P',6);

insert into Utilizzo(IdBarca, IdOp) values ('AL635', 1);
insert into Utilizzo(IdBarca, IdOp) values ('GS870', 2);
insert into Utilizzo(IdBarca, IdOp) values ('ZC112', 2);
insert into Utilizzo(IdBarca, IdOp) values ('AL635', 3);
insert into Utilizzo(IdBarca, IdOp) values ('CD902', 3);
insert into Utilizzo(IdBarca, IdOp) values ('GS870', 4);
insert into Utilizzo(IdBarca, IdOp) values ('FH448', 5);
insert into Utilizzo(IdBarca, IdOp) values ('ZC112', 6);
insert into Utilizzo(IdBarca, IdOp) values ('CD902', 6);

insert into Cattura(IdOp, IdPesce) values (1,728);
insert into Cattura(IdOp, IdPesce) values (1,352);
insert into Cattura(IdOp, IdPesce) values (1,96);
insert into Cattura(IdOp, IdPesce) values (1,1233);
insert into Cattura(IdOp, IdPesce) values (2,6991);
insert into Cattura(IdOp, IdPesce) values (3,447);
insert into Cattura(IdOp, IdPesce) values (3,9427);
insert into Cattura(IdOp, IdPesce) values (3,94);
insert into Cattura(IdOp, IdPesce) values (4,3851);
insert into Cattura(IdOp, IdPesce) values (5,522);
insert into Cattura(IdOp, IdPesce) values (5,3750);
insert into Cattura(IdOp, IdPesce) values (6,2450);
insert into Cattura(IdOp, IdPesce) values (6,2950);
insert into Cattura(IdOp, IdPesce) values (6,3970);
insert into Cattura(IdOp, IdPesce) values (6,4650);

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (728, 'Scampo', 'C' , 'M', 000.18, 00.078, '1A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (352, 'Scampo', 'N' , 'F', 000.12, 00.069, '3A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (96, 'Scampo', 'N' , 'F', 000.11, 00.066, '2B');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (1233, 'Scampo', 'C' , 'M', 000.20, 00.085, '3A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (6991, 'Scampo', 'N' , 'F', 000.14, 00.072, '1B');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (94, 'Merluzzo', 'C' , 'M', 000.86, 13.660, '4A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (522, 'Merluzzo', 'N' , 'M', 000.97, 17.320, '2B');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (3851, 'Merluzzo', 'C' , 'F', 001.04, 18.240, '1A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (9427, 'Merluzzo', 'C' , 'F', 000.92, 15.800, '2A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (447, 'Merluzzo', 'N' , 'M', 001.16, 20.450, '2B');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (3750, 'Vongola', 'C' , 'M', 000.20, 00.025, '2A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (2450, 'Vongola', 'C' , 'M', 000.22, 00.022, '2B');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (2950, 'Vongola', 'C' , 'M', 000.17, 00.024, '3A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (3970, 'Vongola', 'S' , 'M', 000.23, 00.029, '1A');
insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat) values (4650, 'Vongola', 'C' , 'M', 000.21, 00.027, '3B');

insert into TerzoIntermediario (NomeBanca, Iban) values ('INTESA SANPAOLO ANCONA', 'IT26P0300203280125987967226');
insert into TerzoIntermediario (NomeBanca, Iban) values ('CASSA DI RISPARMIO DI FERMO', 'IT30J0300203280389517818243');
insert into TerzoIntermediario (NomeBanca, Iban) values ('CASSA DI RISPARMIO DI MACERATA', 'IT62Q0300203280436789312589');
insert into TerzoIntermediario (NomeBanca, Iban) values ('BPER BANCA JESI', 'IT03H0300203280667622585623');
insert into TerzoIntermediario (NomeBanca, Iban) values ('CASSA DI RISPARMIO DI OSIMO', 'IT87M0300203280363139846759');


update Contratto set NomeDitta = 'Risorsa Pesca', ParIVA = '24439610684' where NumOrd = 509;

update TerzoIntermediario set NomeBanca = 'CASSA DI RISPARMIO DI FERMO', Iban = 'IT27M0300203280614544824587' where NomeBanca = 'INTESA SAN PAOLO ANCONA';
update TerzoIntermediario set Iban = 'IT27M0300203280614544824587' where NomeBanca = 'BPER BANCA JESI';

update Ricercatore set NomeR = 'Maria',CodFisc = 'QLNMRA81L41D974V' where CognomeR = 'Paciocco';
update Ricercatore set CognomeR = 'Cilli', CodFisc = 'CLLGPP69R01A681V' where NomeR = 'Giuseppe';
update Ricercatore set CodFisc = 'FRZRRT96L01G798X', NomeR = 'Roberto', CognomeR = 'Frazzei' where CodFisc = 'RVRVSS63R41G185P';

update Progetto set Budget = 45000.00 where CodProg = 622;

update Pescatore set NomeP = 'Luana', CodFisc = 'BNCLNU78D01F910Z' where CodFisc = 'BNCDBR81I03D110W';
update Pescatore set CognomeP = 'Barberini', CodFisc = 'BRBGLN70H01F750Y' where NomeP = 'Giuliano';
update Pescatore set CodFisc = 'NTNNTN89P01H089L', NomeP = 'Antonio', CognomeP = 'Antonacci' where CodFisc = 'DCCMRT89F10K212L';
update Pescatore set Iban = 'IT24Q0300203280833436497583' where CodFisc = 'NTNNTN89P01H089L';

update Imbarcazione set PortoA = 'La Spezia', PortoP = 'La Spezia' where IdBarca = 'AL635';

update OperazioneDiPesca set data = '2023-01-02', GSA = '16', TipoOss = '1', LatI = '47° 00 00 N', LatF = '44° 00 00 N', LongI = '13° 45 32 E', LongF = '15° 23 43 E', Qbarche = 5 where IdOp = 5;

update AnimalePescato set Nome = 'Merluzzo', CatComm = 'S', Sesso = 'M', Lunghezza = '0.95', Peso = '15.620', StadioMat = '2B' where IdPesce = 6991;

delete from Pescatore;

delete from Contratto where NomeDitta = 'Cuore ittico SAS';

delete from Imbarcazione;

delete from OperazioneDiPesca;

delete from AnimalePescato;


