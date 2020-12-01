use user58db;
select *
from `5tbpciassignment`
group by ENODEB_ID, PCI
having count(*) > 1