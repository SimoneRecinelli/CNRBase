use cnrbase;
 create table Irbim (
     SedeAmm varchar(30),
     parIVA char(11),
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
create TerzoIntermediario(
    NomeBanca varchar(30),
    Iban char(27),
    primary key(NomeBanca,Iban)
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
select * from Irbim;




