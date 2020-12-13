use user58db;
start transaction;
alter table `1tbcell` drop column HEIGHT;
rollback;
select HEIGHT from `1tbcell`