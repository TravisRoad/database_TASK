use user58db;
alter table `1tbcell`
    add check (HEIGHT >= 0);
start transaction;
select *
from `1tbcell`
where HEIGHT < 10;
update `1tbcell`
set HEIGHT = HEIGHT - 8
where HEIGHT < 10;
select *
from `1tbcell`
where HEIGHT < 10;
commit;
select*
from `1tbcell`
where HEIGHT < 10;