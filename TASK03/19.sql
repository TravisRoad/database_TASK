use user58db;
select SECTOR_ID,aQF
from (select SECTOR_NAME, avg(QF) as aQF
      from `12tbcellkpi`
      group by SECTOR_NAME) as SNaQ,`1tbcell`
where aQF > 0.992 and `1tbcell`.SECTOR_NAME=SNaQ.SECTOR_NAME;
