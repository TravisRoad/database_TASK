use user58db;
select count(*)
from `9tbmrodata`
group by TimeStamp,ServingSector,InterferingSector;