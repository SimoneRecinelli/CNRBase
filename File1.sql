use cnrbase;
 create table Irbim (
     SedeAmm varchar(30) primary key,
     ParIVA varchar(11),
     Figura varchar(30)
     );

create table Contratto (
    NumOrd integer primary key,
    CostTot decimal(8,2),
    QBarche smallint,
    NomeDitta varchar(30),
    ParIVA varchar(11)
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



