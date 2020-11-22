use user58db;
select `1tbcell`.SECTOR_ID, `1tbcell`.SECTOR_NAME, `1tbcell`.PCI, `5tbpciassignment`.PCI
from `1tbcell`,
     `4tboptcell`,
     `5tbpciassignment`
where `1tbcell`.SECTOR_ID = `5tbpciassignment`.SECTOR_ID
  and `1tbcell`.PCI = `5tbpciassignment`.PCI;
