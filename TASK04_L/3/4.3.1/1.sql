select N_SECTOR_ID
from user58db.`2tbadjcell`
where N_SECTOR_ID not in(
select SECTOR_ID
from user58db.tbcellcopy);
