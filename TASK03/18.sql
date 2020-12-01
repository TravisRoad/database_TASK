# mysql doesn't have not unique clause!

use user58db;
select all SECTOR_ID
from `1tbcell`,
     `2tbadjcell`
where S_SECTOR_ID in (
    select SECTOR_ID
    from `1tbcell`
    where ENODEBID = 15114
)
  and N_SECTOR_ID = SECTOR_ID
group by SECTOR_ID
having count(SECTOR_ID) >= 2;



