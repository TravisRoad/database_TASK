use user58db;
select SCELL, NCELL, HOATT
from `11tbhandover`
where HOATT >= all (select HOATT
                    from `11tbhandover`);