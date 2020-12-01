use user58db;
select Sector_ID
from tbcell_traffic
group by Sector_ID
having sum(Traffic) >= all (select sum(Traffic)
                            from tbcell_traffic
                            group by Sector_ID)
