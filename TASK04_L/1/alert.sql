alter table user58db.`tbcellcopy`
    add constraint UQ_SECTOR_NAME
        unique (SECTOR_NAME);
alter table user58db.`tbcellCopy`
    add constraint PK_SECTOR_ID
        primary key (SECTOR_ID);
alter table user58db.`tbcellCopy`
    add constraint PK_SECTOR_ID
        primary key (SECTOR_ID);
alter table user58db.tbcellcopy
    alter LATITUDE set default 33.810396;
alter table user58db.tbcellcopy
    alter LONGITUDE set default 112.77068;


