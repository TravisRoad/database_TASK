use user58db;
start transaction;
select SECTOR_ID, HEIGHT
from tbcellcopy
where HEIGHT < 10;
insert into tbcellcopy (CITY, SECTOR_ID, SECTOR_NAME, ENODEBID, ENODEB_NAME, EARFCN, PCI, PSS, SSS, TAC, VENDOR,
                       LONGITUDE, LATITUDE, STYLE, AZIMUTH, ELECTTILT, MECHTILT, TOTLETILT, HEIGHT)
values ('test', '999', 'test', 1, 'test', 1, 1, 1, 1, 1, 'test', 1.0, 1.0, 'test', 1, 1, 1, 1, 9);
update tbcellcopy
set HEIGHT = HEIGHT - 8
where HEIGHT < 10;
select SECTOR_ID, HEIGHT
from tbcellcopy
where SECTOR_ID = '999';
commit;
select SECTOR_ID, HEIGHT
from tbcellcopy
where SECTOR_ID = '999';