use localuser58db;
insert into tbcellcopy (CITY, SECTOR_ID, SECTOR_NAME, ENODEBID, ENODEB_NAME, EARFCN, PCI, PSS, SSS, TAC, VENDOR,
                        LONGITUDE, LATITUDE, STYLE, AZIMUTH, ELECTTILT, MECHTILT, TOTLETILT, HEIGHT)
values ('test', '124672-5', 'test1', 1, 'test', 1, 99998, 1, 1, 1, 'test', 1.0, 1.0, 'test', 1, 1, 1, 1, 888);

insert into tbcellcopy (CITY, SECTOR_ID, SECTOR_NAME, ENODEBID, ENODEB_NAME, EARFCN, PCI, PSS, SSS, TAC, VENDOR,
                        LONGITUDE, LATITUDE, STYLE, AZIMUTH, ELECTTILT, MECHTILT, TOTLETILT, HEIGHT)
values ('test', '124672-5', 'test1', 1, 'test', 1, 12345, 1, 1, 1, 'test', 1.0, 1.0, 'test', 1, 1, 1, 1, 888);


delete from tbcellcopy where SECTOR_ID='124672-5';