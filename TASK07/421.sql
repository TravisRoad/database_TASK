use localuser58db;
SET transaction isolation level read uncommitted;
select @@transaction_isolation;

use localuser58db;
start transaction;
select SECTOR_ID, HEIGHT
from tbcellcopy
where SECTOR_ID = '888';


use localuser58db;
start transaction;
insert into tbcellcopy (CITY, SECTOR_ID, SECTOR_NAME, ENODEBID, ENODEB_NAME, EARFCN, PCI, PSS, SSS, TAC, VENDOR,
                        LONGITUDE, LATITUDE, STYLE, AZIMUTH, ELECTTILT, MECHTILT, TOTLETILT, HEIGHT)
values ('test', '888', 'test1', 1, 'test', 1, 1, 1, 1, 1, 'test', 1.0, 1.0, 'test', 1, 1, 1, 1, 888);
rollback;