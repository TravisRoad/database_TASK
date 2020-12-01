create table user58db.`tbCellCopy`
(
    SECTOR_ID   nvarchar(50),
    SECTOR_NAME nvarchar(255),
    ENODEBID    int(11) not null,
    EARFCN      int(11),
    PCI         int(11),
    PSS         int(11),
    SSS         int(11),
    LONGITUDE   double  default 112.77068,
    LATITUDE    double  default 33.810396,
    AZIMUTH     int(11) default 0,
    HEIGHT      int(11) default 20,
    primary key (SECTOR_ID),
    check (EARFCN in (37900, 38098, 38400, 38950, 39148)),
    check (PCI between 0 and 503),
    check (PCI = 3 * SSS + PSS),
    check (PSS in (0, 1, 2)),
    check (SSS between 0 and 167)
);

-- auto-generated definition
create table user58db.`tbCellCopy`
(
    CITY        nvarchar(255) null,
    SECTOR_ID   varchar(50)   not null,
    SECTOR_NAME nvarchar(255) not null,
    ENODEBID    int(11)           not null,
    ENODEB_NAME nvarchar(255) not null,
    EARFCN      int(11)           not null,
    PCI         int(11)           null,
    PSS         int(11)           null,
    SSS         int(11)           null,
    TAC         int(11)           null,
    VENDOR      nvarchar(255) null,
    LONGITUDE   float         null,
    LATITUDE    float         null,
    STYLE       nvarchar(255) null,
    AZIMUTH     float         not null,
    HEIGHT      int(11)           null,
    ELECTTILT   int(11)           null,
    MECHTILT    int(11)           null,
    TOTLETILT   float         not null,
    primary key (SECTOR_ID),
    check (EARFCN in (37900, 38098, 38400, 38950, 39148)),
    check (PCI between 0 and 503),
    check (PCI = 3 * SSS + PSS),
    check (PSS in (0, 1, 2)),
    check (SSS between 0 and 167),
    check (LONGITUDE between -180.00000 and 180.00000),
    check (LATITUDE between -90.00000 and 90.00000)
);

