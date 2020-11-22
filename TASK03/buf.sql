use user58db;
select SECTOR_NAME, avg(QF)
from `12tbcellkpi`
group by SECTOR_NAME;