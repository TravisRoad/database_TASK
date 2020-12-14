use user58db;

start transaction;
select SECTOR_ID, SECTOR_NAME, HEIGHT
from `1tbcell`
where HEIGHT < 10;
insert into `1tbcell` (CITY, SECTOR_ID, SECTOR_NAME, ENODEBID, ENODEB_NAME, EARFCN, PCI, PSS, SSS, TAC, VENDOR,
                       LONGITUDE, LATITUDE, STYLE, AZIMUTH, ELECTTILT, MECHTILT, TOTLETILT, HEIGHT)
values ('test', '111100-1', 'test', 1, 'test', 1, 1, 1, 1, 1, 'test', 1.0, 1.0, 'test', 1, 1, 1, 1, 9);

savepoint sp;
delete
from `1tbcell`
where SECTOR_ID = '111100-1';
rollback to sp;

commit;

select SECTOR_ID, HEIGHT
from `1tbcell`
where SECTOR_ID = '111100-1';