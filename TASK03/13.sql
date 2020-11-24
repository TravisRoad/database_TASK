use user58db;
select avg(a.Traffic) as average, a.Sector_ID
from tbcell_traffic as a
         inner join `1tbcell` as b on a.Sector_ID = b.SECTOR_ID
group by year(str_to_date(a.Date, "%m/%d/%Y %H:%i:%s")), a.Sector_ID
having average > (select avg(a.Traffic)
                  from tbcell_traffic as a
                           inner join `1tbcell` as b on a.Sector_ID = b.SECTOR_ID
                  where b.EARFCN = 38400)
order by average DESC;