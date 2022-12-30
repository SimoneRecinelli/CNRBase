use cnrbase;
 create table Irbim (
     SedeAmm varchar(30) primary key,
     ParIVA char(11) not null,
     Figura varchar(30)
     );

create table Fattura (
    NumOrd integer primary key,
    CostoTot numeric(8,2),
    QBarche smallint,
    Cedente varchar(30) not null,
    Cessionario varchar(30) not null
    );
create table RDA(
    NumOrd integer primary key,
    CostoTot numeric(8,2),
    QBarche smallint
);
create table Contratto (
    NumOrd integer primary key,
    CostTot decimal(8,2),
    QBarche smallint,
    NomeDitta varchar(30),
    ParIVA char(11) not null
);
create table TerzoIntermediario(
    NomeBanca varchar(30),
    Iban char(27),
    primary key(NomeBanca,Iban)
);
create table Domanda (
    NumOrd integer,
    CodFisc char(16),
    primary key (NumOrd,CodFisc)
);

create table Pescatore (
    CodFisc char(16) primary key,
    Iban char(27) not null,
    NomeP varchar(30),
    CognomeP varchar(30)
);

create table Progetto (
    CodProg integer primary key,
    Budget decimal(8,2) not null
);
create table Partecipazione(
    CodProg integer,
    CodFisc char(16),
    primary key(CodProg,CodFisc)
);
create table Ricercatore(
    CodFisc char(16) primary key,
    NomeR varchar(30),
    CognomeR varchar(30)
);
create table Possesso(
     IdBarca integer,
     CodFisc char(16),
     primary key(IdBarca,CodFisc)
);
drop table Possesso;

create table OperazioneDiPesca(
    IdOp integer primary key,
    GSA smallint,
    TipoOss char(2),
    LatI decimal(8,6),
    LatF decimal(8,6),
    LongI decimal(9,6),
    LongF decimal(9,6),
    Qbarche smallint,
    data date
);
drop table OperazioneDiPesca;

create table Utilizzo(
    IdBarca integer,
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
    IdBarca integer primary key,
    Attrezzo varchar(20),
    LFT smallint,
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
    StadioMat varchar(2),
);
drop table AnimalePescato;
show tables;

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00728, 'Scampo', 'C' , 'M', 000.18, 00.078, '1A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00352, 'Scampo', 'N' , 'F', 000.12, 00.069, '3A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00096, 'Scampo', 'N' , 'F', 000.11, 00.066, '2B');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (01233, 'Scampo', 'C' , 'M', 000.20, 00.085, '3A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (06991, 'Scampo', 'N' , 'F', 000.14, 00.072, '1B');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00094, 'Merluzzo', 'C' , 'M', 000.86, 13.660, '4A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00522, 'Merluzzo', 'N' , 'M', 000.97, 17.320, '2B');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (03851, 'Merluzzo', 'C' , 'F', 001.04, 18.240, '1A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (09427, 'Merluzzo', 'C' , 'F', 000.92, 15.800, '2A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00447, 'Merluzzo', 'N' , 'M', 001.16, 20.450, '2B');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00853, 'Merluzzo', 'C' , 'M', 001.23, 22.380, '1B');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00550, 'Vongola', 'C' , 'M', 000.20, 00.025, '2A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00550, 'Vongola', 'C' , 'M', 000.22, 00.022, '2B');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00550, 'Vongola', 'C' , 'M', 000.17, 00.024, '3A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00550, 'Vongola', 'S' , 'M', 000.23, 00.029, '1A');

insert into AnimalePescato(IdPesce,Nome,CatComm,Sesso,Lunghezza,Peso,StadioMat)
values (00550, 'Vongola', 'C' , 'M', 000.21, 00.027, '3B');

