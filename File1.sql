use cnrbase;
 create table Irbim (
     SedeAmm varchar(30) primary key,
     ParIVA varchar(11),
     Figura varchar(30)
     );
create table Fattura (
    NumOrd integer primary key,
    CostoTot numeric(8,2),
    QBarche smallint,
    Cedente varchar(30),
    Cessionario varchar(30)
    );
create table RDA(
    NumOrd integer primary key,
    CostoTot numeric(8,2),
    QBarche smallint,
    NomeR varchar(30),
    CognomeR varchar(30)
);
create table Contratto (
    NumOrd integer primary key,
    CostTot decimal(8,2),
    QBarche smallint,
    NomeDitta varchar(30),
    ParIVA varchar(11)
);
create TerzoIntermediario(
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
    Iban char(27),
    NomeP varchar(30),
    CognomeP varchar(30)
);

create table Progetto (
    CodProg integer primary key,
    Budget decimal(8,2)
);
create Partecipazione(
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
create table Utilizzo(
    IdBarca integer,
    IdOp integer,
    primary key(IdBarca,IdOp)
);
create table Cattura(
    IdOp integer,
    IdPesce integer,
    primary key(IdOp,IdPesce)
)
create table Imbarcazione (
    IdBarca integer primary key,
    Attrezzo varchar(20),
    LFT smallint,
    PortoP varchar(20),
    PortoA varchar(20)
);

create table UscitaPescatore (
    CodFisc char(16) primary key,
    IdOp integer
);

create table UscitaRicercatore (
    CodFisc char(16) primary key,
    IdOp integer
);

create table AnimalePescato (
    IdPesce integer primary key,
    Nome varchar(20),
    CatComm varchar(20),
    Sesso varchar(7),
    Lunghezza decimal (5,2),
    Peso decimal (4,2),
    StadioMat varchar(20),
    Quantità decimal(8,2)
);

show tables;



