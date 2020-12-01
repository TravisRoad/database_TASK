update user58db.tbcellcopy
set PCI = 1000
where SECTOR_ID = "0000";
select *
from user58db.tbcellcopy
where SECTOR_ID = "0000";