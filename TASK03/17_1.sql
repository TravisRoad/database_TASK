# mysql doesn't have not exists clause!
use user58db;
select SCELL, NCELL
from `11tbhandover`
where NCELL not in (select NCELL
                    from `11tbhandover`
                    where NCELL in ('15290-128', '259595-1', '124711-0', '47444-1'))


