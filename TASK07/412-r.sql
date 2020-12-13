use user58db;
start transaction;
select SECTOR_ID, EARFCN
from `1tbcell`
where SECTOR_ID between '124672-0' and '124675-2';
update `1tbcell`
set EARFCN = 38400
where SECTOR_ID between '124672-0' and '124675-0';
select SECTOR_ID, EARFCN
from `1tbcell`
where SECTOR_ID between '124672-0' and '124675-2';
rollback;
select SECTOR_ID, EARFCN
from `1tbcell`
where SECTOR_ID between '124672-0' and '124675-2';