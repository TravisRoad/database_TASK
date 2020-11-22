use user58db;
with cSEC(SID, _count) as (select S_SECTOR_ID, count(N_SECTOR_ID)
                from `2tbadjcell`
                group by S_SECTOR_ID)
select SID, max(_count)
from cSEC,`1tbcell`;
