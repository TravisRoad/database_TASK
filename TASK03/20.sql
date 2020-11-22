use user58db;
with avgQF(aQF, aNAME) as (select avg(QF), SECTOR_NAME
                           from `12tbcellkpi`
                           group by SECTOR_NAME)
select SECTOR_ID, avgQF.aQF
from `1tbcell`,
     avgQF
where avgQF.aQF > 0.992
  and `1tbcell`.SECTOR_NAME = avgQF.aNAME;
