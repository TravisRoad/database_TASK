update user58db.`1tbcell` AS a, user58db.`5tbpciassignment` as b
set a.PCI = b.PCI
where a.SECTOR_ID = b.SECTOR_ID;