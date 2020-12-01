use user58db;
select SCELL, NCELL, HOATT
from `11tbhandover`
group by SCELL
having max(HOATT);

/*
where HOATT >= all (select HOATT
                    from `11tbhandover`);*/