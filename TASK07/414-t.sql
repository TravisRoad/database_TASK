use user58db;
start transaction;
select SECTOR_ID, SECTOR_NAME, HEIGHT
from `1tbcell`
where HEIGHT < 10;

insert into `1tbcell` (SECTOR_ID, HEIGHT)
values ('111100-1', 9);
delete
from `1tbcell`
where SECTOR_ID = '111100-1';

select SECTOR_ID, SECTOR_NAME, HEIGHT
from `1tbcell`
where HEIGHT < 10;
commit;