use user58db;
select SECTOR_ID, SECTOR_NAME, HEIGHT
from `1tbcell`
where HEIGHT > some (select HEIGHT
                     from `1tbcell`
                     where 111 <= LONGITUDE <= 112
                       and 33.2 <= LATITUDE <= 33.6)