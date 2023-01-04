use cnrbase;

update Contratto
set NomeDitta = 'Risorsa Pesca',
    ParIVA    = '24439610684'
where NumOrd = 509;

update TerzoIntermediario
set NomeBanca = 'CASSA DI RISPARMIO DI FERMO',
    Iban      = 'IT27M0300203280614544824587'
where NomeBanca = 'INTESA SAN PAOLO ANCONA';
update TerzoIntermediario
set Iban = 'IT27M0300203280614544824587'
where NomeBanca = 'BPER BANCA JESI';

update Ricercatore
set NomeR   = 'Maria',
    CodFisc = 'QLNMRA81L41D974V'
where CognomeR = 'Paciocco';
update Ricercatore
set CognomeR = 'Cilli',
    CodFisc  = 'CLLGPP69R01A681V'
where NomeR = 'Giuseppe';
update Ricercatore
set CodFisc  = 'FRZRRT96L01G798X',
    NomeR    = 'Roberto',
    CognomeR = 'Frazzei'
where CodFisc = 'RVRVSS63R41G185P';

update Progetto
set Budget = 45000.00
where CodProg = 622;

update Pescatore
set NomeP   = 'Luana',
    CodFisc = 'BNCLNU78D01F910Z'
where CodFisc = 'BNCDBR81I03D110W';
update Pescatore
set CognomeP = 'Barberini',
    CodFisc  = 'BRBGLN70H01F750Y'
where NomeP = 'Giuliano';
update Pescatore
set CodFisc  = 'NTNNTN89P01H089L',
    NomeP    = 'Antonio',
    CognomeP = 'Antonacci'
where CodFisc = 'DCCMRT89F10K212L';
update Pescatore
set Iban = 'IT24Q0300203280833436497583'
where CodFisc = 'NTNNTN89P01H089L';

update Imbarcazione
set PortoA = 'La Spezia',
    PortoP = 'La Spezia'
where IdBarca = 'AL635';

update OperazioneDiPesca
set Data    = '2023-01-02',
    GSA     = '16',
    TipoOss = 'S',
    LatI    = '47° 00 00 N',
    LatF    = '44° 00 00 N',
    LongI   = '13° 45 32 E',
    LongF   = '15° 23 43 E',
    Qbarche = 5
where IdOp = 5;

update AnimalePescato
set Nome      = 'Merluzzo',
    CatComm   = 'S',
    Sesso     = 'M',
    Lunghezza = '0.95',
    Peso      = '15.620',
    StadioMat = '2B'
where IdPesce = 6991;

delete
from Pescatore
where 1;

delete
from Contratto
where NomeDitta = 'Cuore ittico SAS';

delete
from Imbarcazione
where 1;

delete
from OperazioneDiPesca
where 1;

delete
from AnimalePescato
where 1;
show tables;

drop table AnimalePescato;
drop table Cattura;
drop table Contratto;
drop table Domanda;
drop table Fattura;
drop table Imbarcazione;
drop table Irbim;
drop table OperazioneDiPesca;
drop table Partecipazione;
drop table Pescatore;
drop table TerzoIntermediario;
drop table UscitaPescatore;
drop table UscitaRicercatore;
drop table Utilizzo;
drop table RDA;
drop table Possesso;
drop table Ricercatore;
drop table Progetto;

create table Irbim
(
    SedeAmm varchar(30) primary key,
    ParIVA  char(11) not null,
    Figura  varchar(30)
);


create table Fattura
(
    NumOrd      integer primary key,
    CostoTot    numeric(8, 2) not null,
    QBarche     smallint      not null default 1
        check ( QBarche > 0 ),
    Cedente     varchar(30)   not null,
    Cessionario varchar(40)   not null
);



create table RDA
(
    NumOrd   integer primary key,
    CostoTot numeric(8, 2),
    QBarche  smallint not null default 1
        check ( QBarche > 0 )
);


create table Contratto
(
    NumOrd    integer primary key,
    CostTot   decimal(8, 2),
    QBarche   smallint not null default 1
        check ( QBarche > 0 ),
    NomeDitta varchar(30),
    ParIVA    char(11) not null
);



create table TerzoIntermediario
(
    NomeBanca varchar(30),
    Iban      char(27),
    primary key (NomeBanca, Iban)
);



create table Domanda
(
    NumOrd  integer
        references RDA (NumOrd)
            on update cascade
            on delete no action,
    CodFisc char(16)
        references Pescatore (CodFisc)
            on update cascade
            on delete no action,
    primary key (NumOrd, CodFisc)
);


create table Pescatore
(
    CodFisc  char(16) primary key,
    Iban     char(27) not null,
    NomeP    varchar(30),
    CognomeP varchar(30)
);



create table Progetto
(
    CodProg integer primary key,
    Budget  decimal(8, 2) not null
        check ( Budget > 0 )
);


create table Partecipazione
(
    CodProg integer,
    CodFisc char(16),
    primary key (CodProg, CodFisc)
);



create table Ricercatore
(
    CodFisc  char(16) primary key,
    NomeR    varchar(30),
    CognomeR varchar(30)
);



create table Possesso
(
    IdBarca varchar(8)
        references Imbarcazione (IdBarca)
            on update cascade
            on delete no action,
    CodFisc char(16)
        references Pescatore (CodFisc)
            on update cascade
            on delete no action,
    primary key (IdBarca, CodFisc)
);


create table OperazioneDiPesca
(
    IdOp    integer primary key,
    GSA     smallint not null,
    TipoOss char(1),
    LatI    varchar(15),
    LatF    varchar(15),
    LongI   varchar(15),
    LongF   varchar(15),
    Qbarche smallint not null default 1
        check ( Qbarche > 0 ),
    Data    date
);


create table Utilizzo
(
    IdBarca varchar(8)
        references Imbarcazione (IdBarca)
            on update cascade
            on delete no action,
    IdOp    integer
        references OperazioneDiPesca (IdOp)
            on update cascade
            on delete no action,
    primary key (IdBarca, IdOp)
);


create table Cattura
(
    IdOp    integer
        references OperazioneDiPesca (IdOp)
            on update cascade
            on delete no action,
    IdPesce integer
        references AnimalePescato (IdPesce)
            on update cascade
            on delete no action,
    primary key (IdOp, IdPesce)
);


create table Imbarcazione
(
    IdBarca  varchar(8) primary key,
    Attrezzo varchar(30) not null,
    LFT      decimal(4, 2)
        check ( LFT > 0 ),
    PortoP   varchar(20) not null,
    PortoA   varchar(20) not null
);


create table UscitaPescatore
(
    CodFisc char(16)
        references Pescatore (CodFisc)
            on update cascade
            on delete no action,
    IdOp    integer
        references OperazioneDiPesca (IdOp)
            on update cascade
            on delete no action,
    primary key (CodFisc, IdOp)
);


create table UscitaRicercatore
(
    CodFisc char(16)
        references Ricercatore (CodFisc)
            on update cascade
            on delete no action,
    IdOp    integer
        references OperazioneDiPesca (IdOp)
            on update cascade
            on delete no action,
    primary key (CodFisc, IdOp)
);


create table AnimalePescato
(
    IdPesce   integer primary key,
    Nome      varchar(20) not null,
    CatComm   varchar(20),
    Sesso     varchar(1)  not null,
    Lunghezza decimal(5, 2)
        check (Lunghezza > 0),
    Peso      decimal(5, 3)
        check (Peso > 0),
    StadioMat varchar(2)
);



insert into Irbim (SedeAmm, ParIVA, Figura)
values ('Ancona', 21145647324, 'Amministratore');
insert into Irbim (SedeAmm, ParIVA, Figura)
values ('Mazara Del Vallo', 34528374621, 'Amministratore');
insert into Irbim (SedeAmm, ParIVA, Figura)
values ('Lesina', 98726327436, 'Amministratore');

insert into RDA (NumOrd, CostoTot, QBarche)
values (1589, 1502.00, 2);
insert into RDA (NumOrd, CostoTot, QBarche)
values (1385, 2300.00, 1);
insert into RDA (NumOrd, CostoTot, QBarche)
values (4857, 1260.00, 3);
insert into RDA (NumOrd, CostoTot, QBarche)
values (3034, 3000.00, 3);
insert into RDA (NumOrd, CostoTot, QBarche)
values (4372, 6704.00, 2);
insert into RDA (NumOrd, CostoTot, QBarche)
values (509, 1198.00, 1);
insert into RDA (NumOrd, CostoTot, QBarche)
values (102, 5400.00, 3);
insert into RDA (NumOrd, CostoTot, QBarche)
values (8743, 3489.00, 2);

insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario)
values (1589, 1502.00, 2, 'CASSA DI RISPARMIO DI FERMO', 'CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario)
values (1385, 2300.00, 1, 'CASSA DI RISPARMIO DI OSIMO', 'CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario)
values (4857, 1260.00, 3, 'CASSA DI RISPARMIO DI MACERATA', 'CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario)
values (3034, 3000.00, 3, 'CASSA DI RISPARMIO DI FERMO', 'CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario)
values (4372, 6704.00, 2, 'CASSA DI RISPARMIO DI MACERATA', 'CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario)
values (509, 1198.00, 1, 'CASSA DI RISPARMIO DI FERMO', 'CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario)
values (102, 5400.00, 3, 'CASSA DI RISPARMIO DI OSIMO', 'CNR ISTITUTO RISORSE BIOLOGICHE');
insert into Fattura (NumOrd, CostoTot, QBarche, Cedente, Cessionario)
values (8743, 3489.00, 2, 'CASSA DI RISPARMIO DI MACERATA', 'CNR ISTITUTO RISORSE BIOLOGICHE');

insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA)
values (1589, 1502.00, 2, 'F.lli Gianni Pesca SPA', 50982900529);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA)
values (1385, 2300.00, 1, 'Cuore ittico SAS', 60888610627);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA)
values (4857, 1260.00, 3, 'Emporio del Marinaio SPA', 74936370159);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA)
values (3034, 3000.00, 3, 'F.lli Gianni Pesca SAS', 50982900529);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA)
values (4372, 6704.00, 2, 'Cuore ittico SAS', 60888610627);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA)
values (509, 1198.00, 1, 'F.lli Gianni Pesca SPA', 50982900529);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA)
values (102, 5400.00, 3, 'Cuore ittico SAS', 60888610627);
insert into Contratto (NumOrd, CostTot, QBarche, NomeDitta, ParIVA)
values (8743, 3489.00, 2, 'Emporio del Marinaio SPA', 74936370159);

insert into Progetto (CodProg, Budget)
values (1021, 023670.00);
insert into Progetto (CodProg, Budget)
values (874, 018842.00);
insert into Progetto (CodProg, Budget)
values (2641, 061025.00);
insert into Progetto (CodProg, Budget)
values (622, 112300.00);

insert into Pescatore(CodFisc, Iban, NomeP, CognomeP)
values ('RSSGLN88C12G631L', 'IT16B0300203280654193989541', 'Giuliano', 'Rossi');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP)
values ('VRDFRC72E26D145W', 'IT70J0300203280943618364116', 'Francesco', 'Verdi');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP)
values ('ZMPMRC76A08G439W', 'IT50Z0300203280882854883384', 'Marco', 'Zampa');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP)
values ('DCCMRT89F10K212L', 'IT85X0300203280325219582297', 'Marta', 'De Cecco');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP)
values ('BNCDBR81I03D110W', 'IT47S0300203280992657365563', 'Debora', 'Bianchi');
insert into Pescatore(CodFisc, Iban, NomeP, CognomeP)
values ('SRGRRT90L01I607X', 'IT19R0300203280396558915351', 'Roberto', 'Soraggi');


insert into UscitaPescatore(CodFisc, IdOp)
values ('RSSGLN88C12G631L', 1);
insert into UscitaPescatore(CodFisc, IdOp)
values ('VRDFRC72E26D145W', 1);
insert into UscitaPescatore(CodFisc, IdOp)
values ('ZMPMRC76A08G439W', 2);
insert into UscitaPescatore(CodFisc, IdOp)
values ('DCCMRT89F10K212L', 2);
insert into UscitaPescatore(CodFisc, IdOp)
values ('BNCDBR81I03D110W', 3);
insert into UscitaPescatore(CodFisc, IdOp)
values ('DCCMRT89F10K212L', 4);
insert into UscitaPescatore(CodFisc, IdOp)
values ('RSSGLN88C12G631L', 5);
insert into UscitaPescatore(CodFisc, IdOp)
values ('BNCDBR81I03D110W', 6);

insert into Ricercatore(CodFisc, NomeR, CognomeR)
values ('CPPFNC69T09F315F', 'Franco', 'Ceppi');
insert into Ricercatore(CodFisc, NomeR, CognomeR)
values ('CHLGCM73L01E388X', 'Giacomo', 'Chiola');
insert into Ricercatore(CodFisc, NomeR, CognomeR)
values ('PNTLSS80B28E388T', 'Alessia', 'Pantani');
insert into Ricercatore(CodFisc, NomeR, CognomeR)
values ('RVRVSS63R41G185P', 'Vanessa', 'Raverta');
insert into Ricercatore(CodFisc, NomeR, CognomeR)
values ('CLLGPP84L01D696J', 'Giuseppe', 'Cilli');
insert into Ricercatore(CodFisc, NomeR, CognomeR)
values ('GVNNGL90T30C252V', 'Angelo', 'Giovannetti');
insert into Ricercatore(CodFisc, NomeR, CognomeR)
values ('CRDCCL85A41F789X', 'Cecilia', 'Caredio');

insert into UscitaRicercatore(CodFisc, IdOp)
values ('CPPFNC69T09F315F', 1);
insert into UscitaRicercatore(CodFisc, IdOp)
values ('CHLGCM73L01E388X', 2);
insert into UscitaRicercatore(CodFisc, IdOp)
values ('PNTLSS80B28E388T', 2);
insert into UscitaRicercatore(CodFisc, IdOp)
values ('RVRVSS63R41G185P', 3);
insert into UscitaRicercatore(CodFisc, IdOp)
values ('CLLGPP84L01D696J', 4);
insert into UscitaRicercatore(CodFisc, IdOp)
values ('GVNNGL90T30C252V', 5);
insert into UscitaRicercatore(CodFisc, IdOp)
values ('CRDCCL85A41F789X', 6);

insert into Partecipazione(CodProg, CodFisc)
values (1021, 'PNTLSS80B28E388T');
insert into Partecipazione(CodProg, CodFisc)
values (1021, 'CHLGCM73L01E388X');
insert into Partecipazione(CodProg, CodFisc)
values (2641, 'CLLGPP84L01D696J');
insert into Partecipazione(CodProg, CodFisc)
values (622, 'RVRVSS63R41G185P');
insert into Partecipazione(CodProg, CodFisc)
values (622, 'CPPFNC69T09F315F');
insert into Partecipazione(CodProg, CodFisc)
values (874, 'GVNNGL90T30C252V');
insert into Partecipazione(CodProg, CodFisc)
values (874, 'CRDCCL85A41F789X');
insert into Partecipazione(CodProg, CodFisc)
values (1021, 'GVNNGL90T30C252V');

insert into Domanda(NumOrd, CodFisc)
values (1589, 'CPPFNC69T09F315F');
insert into Domanda(NumOrd, CodFisc)
values (1385, 'CHLGCM73L01E388X');
insert into Domanda(NumOrd, CodFisc)
values (4857, 'PNTLSS80B28E388T');
insert into Domanda(NumOrd, CodFisc)
values (3034, 'RVRVSS63R41G185P');
insert into Domanda(NumOrd, CodFisc)
values (4372, 'CLLGPP84L01D696J');
insert into Domanda(NumOrd, CodFisc)
values (509, 'GVNNGL90T30C252V');
insert into Domanda(NumOrd, CodFisc)
values (102, 'CRDCCL85A41F789X');
insert into Domanda(NumOrd, CodFisc)
values (8743, 'CLLGPP84L01D696J');

insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA)
values ('AL635', 'Cogollo', 06.30, 'Ancona', 'Ancona');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA)
values ('GS870', 'Lampara', 05.80, 'Pescara', 'Pescara');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA)
values ('ZC112', 'Nasse', 07.10, 'Ancona', 'Ancona');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA)
values ('CD902', 'Strascico', 06.00, 'Ancona', 'Ancona');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA)
values ('AZ205', 'Vongolara', 06.90, 'Bari', 'Bari');
insert into Imbarcazione(IdBarca, Attrezzo, LFT, PortoP, PortoA)
values ('FH448', 'Volante', 07.40, 'Ancona', 'Ancona');

insert into Possesso(IdBarca, CodFisc)
values ('AL635', 'RSSGLN88C12G631L');
insert into Possesso(IdBarca, CodFisc)
values ('AL635', 'VRDFRC72E26D145W');
insert into Possesso(IdBarca, CodFisc)
values ('GS870', 'ZMPMRC76A08G439W');
insert into Possesso(IdBarca, CodFisc)
values ('ZC112', 'DCCMRT89F10K212L');
insert into Possesso(IdBarca, CodFisc)
values ('CD902', 'BNCDBR81I03D110W');
insert into Possesso(IdBarca, CodFisc)
values ('AZ205', 'SRGRRT90L01I607X');
insert into Possesso(IdBarca, CodFisc)
values ('FH448', 'SRGRRT90L01I607X');

insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data)
values (1, 17, 'S', '43° 00 00 N', '42° 51 00 N', '14° 56 00 E', '15° 16 00 E', 1, '2021-08-17');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data)
values (2, 17, 'N', '45° 10 00 N', '45° 16 00 N', '12° 32 00 E', '12° 21 00 E', 2, '2021-09-03');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data)
values (3, 18, 'N', '43° 00 00 N', '42° 51 00 N', '14° 56 00 E', '15° 16 00 E', 2, '2021-09-13');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data)
values (4, 18, 'S', '44° 00 00 N', '44° 07 00 N', '13° 38 50 E', '13° 50 00 E', 1, '2021-09-27');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data)
values (5, 17, 'S', '45° 10 00 N', '45° 16 00 N', '12° 32 00 E', '12° 21 00 E', 1, '2021-10-05');
insert into OperazioneDiPesca(IdOp, GSA, TipoOss, LatI, LatF, LongI, LongF, Qbarche, data)
values (6, 18, 'S', '44° 00 00 N', '44° 07 00 N', '13° 38 50 E', '13° 50 00 E', 2, '2021-10-14');

insert into Utilizzo(IdBarca, IdOp)
values ('AL635', 1);
insert into Utilizzo(IdBarca, IdOp)
values ('GS870', 2);
insert into Utilizzo(IdBarca, IdOp)
values ('ZC112', 2);
insert into Utilizzo(IdBarca, IdOp)
values ('AL635', 3);
insert into Utilizzo(IdBarca, IdOp)
values ('CD902', 3);
insert into Utilizzo(IdBarca, IdOp)
values ('GS870', 4);
insert into Utilizzo(IdBarca, IdOp)
values ('FH448', 5);
insert into Utilizzo(IdBarca, IdOp)
values ('ZC112', 6);
insert into Utilizzo(IdBarca, IdOp)
values ('CD902', 6);

insert into Cattura(IdOp, IdPesce)
values (1, 728);
insert into Cattura(IdOp, IdPesce)
values (1, 352);
insert into Cattura(IdOp, IdPesce)
values (1, 96);
insert into Cattura(IdOp, IdPesce)
values (1, 1233);
insert into Cattura(IdOp, IdPesce)
values (2, 6991);
insert into Cattura(IdOp, IdPesce)
values (3, 447);
insert into Cattura(IdOp, IdPesce)
values (3, 9427);
insert into Cattura(IdOp, IdPesce)
values (3, 94);
insert into Cattura(IdOp, IdPesce)
values (4, 3851);
insert into Cattura(IdOp, IdPesce)
values (5, 522);
insert into Cattura(IdOp, IdPesce)
values (5, 3750);
insert into Cattura(IdOp, IdPesce)
values (6, 2450);
insert into Cattura(IdOp, IdPesce)
values (6, 2950);
insert into Cattura(IdOp, IdPesce)
values (6, 3970);
insert into Cattura(IdOp, IdPesce)
values (6, 4650);

insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (728, 'Scampo', 'C', 'M', 000.18, 00.078, '1A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (352, 'Scampo', 'N', 'F', 000.12, 00.069, '3A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (96, 'Scampo', 'N', 'F', 000.11, 00.066, '2B');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (1233, 'Scampo', 'C', 'M', 000.20, 00.085, '3A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (6991, 'Scampo', 'N', 'F', 000.14, 00.072, '1B');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (94, 'Merluzzo', 'C', 'M', 000.86, 13.660, '4A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (522, 'Merluzzo', 'N', 'M', 000.97, 17.320, '2B');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (3851, 'Merluzzo', 'C', 'F', 001.04, 18.240, '1A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (9427, 'Merluzzo', 'C', 'F', 000.92, 15.800, '2A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (447, 'Merluzzo', 'N', 'M', 001.16, 20.450, '2B');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (3750, 'Vongola', 'C', 'M', 000.20, 00.025, '2A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (2450, 'Vongola', 'C', 'M', 000.22, 00.022, '2B');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (2950, 'Vongola', 'C', 'M', 000.17, 00.024, '3A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (3970, 'Vongola', 'S', 'M', 000.23, 00.029, '1A');
insert into AnimalePescato(IdPesce, Nome, CatComm, Sesso, Lunghezza, Peso, StadioMat)
values (4650, 'Vongola', 'C', 'M', 000.21, 00.027, '3B');

insert into TerzoIntermediario (NomeBanca, Iban)
values ('INTESA SANPAOLO ANCONA', 'IT26P0300203280125987967226');
insert into TerzoIntermediario (NomeBanca, Iban)
values ('CASSA DI RISPARMIO DI FERMO', 'IT30J0300203280389517818243');
insert into TerzoIntermediario (NomeBanca, Iban)
values ('CASSA DI RISPARMIO DI MACERATA', 'IT62Q0300203280436789312589');
insert into TerzoIntermediario (NomeBanca, Iban)
values ('BPER BANCA JESI', 'IT03H0300203280667622585623');
insert into TerzoIntermediario (NomeBanca, Iban)
values ('CASSA DI RISPARMIO DI OSIMO', 'IT87M0300203280363139846759');



select distinct P.nomeP as Nome_Pescatore, P.CognomeP as Cognome_Pescatore
from Pescatore P
         inner join UscitaPescatore UP
                    on P.CodFisc = UP.CodFisc
where P.CodFisc IN (select UP2.CodFisc
                    from UscitaPescatore UP2
                             inner join OperazioneDiPesca OP
                                        on UP2.IdOp = OP.IdOp
                    where OP.Data = '2021-08-17')
ORDER BY P.NomeP ASC, P.CognomeP ASC;

select distinct Attrezzo
from Imbarcazione I
         inner join Utilizzo U
                    on I.IdBarca = U.IdBarca
where I.IdBarca IN (select U2.IdBarca
                    from Utilizzo U2
                             inner join Cattura C
                                        on U2.IdOp = C.IdOp
                    where C.IdPesce = 728);

select R.NumOrd,R.QBarche
from RDA R
         inner join Domanda D
                    on R.NumOrd = D.NumOrd
where D.CodFisc = 'CLLGPP84L01D696J'
order by QBarche ASC;

select I.LFT
from Imbarcazione I
         inner join Possesso P
                    on I.IdBarca = P.IdBarca
where P.CodFisc = 'DCCMRT89F10K212L';

select Op.data
from OperazioneDiPesca OP
         inner join Cattura C
                    on OP.IdOp = C.IdOp
where C.IdPesce = '522';

select Attrezzo
from Imbarcazione I
         inner join Utilizzo U
                    on I.IdBarca = U.IdBarca
where U.IdOp = 6;

select SUM(Peso) as Peso_Totale
from AnimalePescato AP
         inner join Cattura C
                    on AP.IdPesce = C.IdPesce
where C.IdOp IN (select OP.IdOp
                 from OperazioneDiPesca OP
                          inner join Cattura C2
                                     on OP.IdOp = C2.IdOp
                 where OP.Data = '2021-09-13');

select NomeP as Nome_Pescatore, CognomeP as Cognome_Pescatore
from Pescatore P
         inner join UscitaPescatore UP
                    on P.CodFisc = UP.CodFisc
where UP.IdOp IN (select OP.IdOp
                  from OperazioneDiPesca OP
                           inner join Cattura C
                                      on OP.IdOp = C.IdOp
                  where C.IdPesce = 6991);

select NomeDitta, ParIVA
from Contratto;

select RDA.NumOrd, R.NomeR, R.CognomeR
from Ricercatore R,
     RDA rda
         inner join Domanda D
                    on rda.NumOrd = D.NumOrd
where R.CodFisc = D.CodFisc;

select AVG(A.Peso) as Media_peso, AVG(A.Lunghezza) as Media_Lunghezza
from AnimalePescato A
         inner join Cattura C
                    on A.IdPesce = C.IdPesce
where A.Nome = 'Merluzzo'
  and C.IdOp IN (select Op.IdOp
                 from OperazioneDiPesca Op
                 where Op.Data between '2021-08-10' and '2021-10-01');

select COUNT(AP.IdPesce) as Numero_Animali_Pescati
from AnimalePescato AP
         inner join Cattura C
                    on Ap.IdPesce = C.IdPesce
where AP.CatComm = 'C'
  and C.IdOp IN (select OP.IdOp
                 from OperazioneDiPesca OP
                 where OP.Data between '2021-08-10' and '2021-10-01');

select P.NomeP, P.CognomeP
from Pescatore P
         inner join Possesso Poss
                    on P.CodFisc = Poss.CodFisc
where Poss.IdBarca IN (select I.IdBarca
                       from Imbarcazione I
                                inner join Utilizzo U
                                           on I.IdBarca = U.IdBarca
                       where I.Attrezzo = 'Cogollo'
                         and U.IdOp IN (select OP.IdOp
                                        from OperazioneDiPesca OP
                                        where OP.Data = '2021-08-17'));


select I.IdBarca, I.PortoA, I.PortoP
from Imbarcazione I
         inner join Utilizzo U
                    on I.IdBarca = U.IdBarca
where U.IdOp IN (select Op.IdOp
                 from OperazioneDiPesca Op
                          inner join Cattura C
                                     on Op.IdOp = C.IdOp
                 where Op.IdOp = 3
                   and C.IdPesce In (select AnimalePescato.IdPesce
                                     from AnimalePescato
                                     where Nome = 'Merluzzo'));


select OP.TipoOss, UR.CodFisc as Codice_Fiscale
from OperazioneDiPesca OP
inner join UscitaRicercatore UR
on OP.IdOp = UR.IdOp
where OP.Data = '2021-09-03';