select SECTOR_ID, count(*)
from user58db.tbcellcopy
group by SECTOR_ID
having count(*) > 1;
