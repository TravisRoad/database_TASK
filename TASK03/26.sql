# select *
# from user58db.`11tbhandover`
# order by HOATT asc;
#
# insert into user58db.`11tbhandover`
# values ("h","h","h",0,0,0);

delete
from user58db.`11tbhandover`
where HOATT = (select min(HOATT) from (select * from user58db.`11tbhandover`) as x);