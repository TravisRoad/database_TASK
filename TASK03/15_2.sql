use user58db;
select CellID, RSRP
from `6tbatudata`
where RSRP > some (select RSRP
                   from `6tbatudata`
                   where CellID in (select SECTOR_ID
                                    from `5tbpciassignment`
                                    where ENODEB_ID = 253903));