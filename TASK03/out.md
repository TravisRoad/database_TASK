- buf.sql
```sql
use user58db;
select SECTOR_NAME, avg(QF)
from `12tbcellkpi`
group by SECTOR_NAME;
```

- 1.sql
```sql
SELECT ENODEBID, ENODEB_NAME, LONGITUDE, LATITUDE, PCI as "Physical Cell Identity", AZIMUTH, HEIGHT
FROM user58db.`1tbcell`
WHERE LONGITUDE BETWEEN 100 AND 120
  AND CITY = "sanxia"
  AND LATITUDE BETWEEN 20 AND 40
  AND PCI BETWEEN 0 AND 200
  AND VENDOR is not null
ORDER BY LONGITUDE DESC, LATITUDE DESC, EARFCN DESC;
```

- 2.sql
```sql
SELECT distinct ENODEBID, ENODEB_NAME, LONGITUDE, LATITUDE, STYLE, VENDOR
FROM user58db.`1tbcell`
WHERE LONGITUDE BETWEEN 100 AND 120
  AND CITY = "sanxia"
ORDER BY LONGITUDE DESC, LATITUDE DESC;
```

- 2_distinct.sql
```sql
SELECT distinct ENODEBID, ENODEB_NAME, LONGITUDE, LATITUDE, STYLE, VENDOR
FROM user58db.`1tbcell`
WHERE LONGITUDE BETWEEN 100 AND 120
  AND CITY = "sanxia"
ORDER BY LONGITUDE DESC, LATITUDE DESC;
```

- 2_non_distinct.sql
```sql
SELECT ENODEBID, ENODEB_NAME, LONGITUDE, LATITUDE, STYLE, VENDOR
FROM user58db.`1tbcell`
WHERE LONGITUDE BETWEEN 100 AND 120
  AND CITY = "sanxia"
ORDER BY LONGITUDE DESC, LATITUDE DESC;
```

- 3.sql
```sql
SELECT SECTOR_NAME
FROM user58db.`1tbcell`
WHERE (SECTOR_NAME LIKE "A池%"
    OR SECTOR_NAME LIKE "高铁%"
    OR SECTOR_NAME LIKE "%医院%"
    OR SECTOR_NAME LIKE "%实验高中%")
  AND NOT SECTOR_NAME LIKE "%-1";
```

- 4.sql
```sql
SELECT SECTOR_NAME
FROM user58db.`1tbcell`
WHERE SECTOR_NAME LIKE "_____-%-%"
  AND ENODEB_NAME LIKE "____%____";
```

- 5.sql
```sql
(SELECT SECTOR, SECTOR_NAME
 FROM user58db.`12tbcellkpi`
 WHERE QF > 0.95)
UNION ALL
(SELECT SECTOR, SECTOR_NAME
 FROM user58db.`12tbcellkpi`
 WHERE ERABf > 0.99)
```

- 6.sql
```sql
SELECT ENODEBID, ENODEB_NAME
FROM user58db.`1tbcell`
WHERE LATITUDE in (
    SELECT MAX(LATITUDE) as LATITUDE
    FROM user58db.`1tbcell`
);
```

- 7.sql
```sql
use user58db;
SELECT *
FROM `9tbmrodata`,
     `6tbatudata`;
```

- 8.sql
```sql
select *
from user58db.`2tbadjcell` as a
         inner join user58db.`3tbsecadjcel` as b
                    on a.S_SECTOR_ID = b.S_SECTOR_ID and a.N_SECTOR_ID = b.N_SECTOR_ID;
```

- 9.sql
```sql
SELECT *
FROM (
         select A.SECTOR_ID,
                C.SECTOR_NAME,
                A.NCELL_ID,
                B.NSECTOR_ID
         FROM user58db.`7tbatuc2i` AS A
                  INNER JOIN user58db.`8tbatuhandover` AS B
                  INNER JOIN user58db.`1tbcell` AS C
                             ON A.SECTOR_ID = B.NSECTOR_ID AND A.SECTOR_ID = C.SECTOR_ID
         WHERE A.SECTOR_ID = "238397-1"
           and COSITE = 1
     ) AS TMP;
```

- 10.sql
```sql
SELECT B.SCELL, C.SECTOR_NAME AS SS_NAME, B.NCELL, D.SECTOR_NAME AS NS_NAME
FROM user58db.`10tbc2i` AS A,
     user58db.`10tbc2i` AS B,
     user58db.`1tbcell` AS C,
     user58db.`1tbcell` AS D
WHERE A.SCELL = "124673-0"
  AND A.NCELL = "259772-0"
  AND A.C2I_Mean < B.C2I_Mean
  AND C.SECTOR_ID = B.SCELL
  AND D.SECTOR_ID = B.NCELL
ORDER BY B.C2I_Mean DESC;
```

- 11.sql
```sql
-- 最大值得相关信息
with t as (SELECT sum(A.Traffic) as s, A.Sector_ID, B.SECTOR_NAME, B.LONGITUDE, B.LATITUDE
           FROM user58db.`tbcell_traffic` AS A
                    INNER JOIN user58db.`1tbcell` AS B ON A.Sector_ID = B.SECTOR_ID
           WHERE (
               A.Hour BETWEEN 9 AND 11 OR A.Hour BETWEEN 19 AND 21
               )
             AND B.LATITUDE BETWEEN -90
               AND 90
             AND B.LONGITUDE BETWEEN 0
               AND 120
             AND str_to_date(A.Date, "%m/%d/%Y %H:%i:%s") BETWEEN str_to_date("05/01/2020", "%m/%d/%Y %H:%i:%s")
               AND str_to_date("5/31/2020", "%m/%d/%Y %H:%i:%s")
           GROUP BY A.SECTOR_ID)
select max(s) as MAX, t.Sector_ID, t.SECTOR_NAME, t.LATITUDE, t.LONGITUDE
from t
WHERE s = (SELECT MAX(t.s) from t);

-- 最大最小平均
with t as (SELECT sum(A.Traffic) as s, A.Sector_ID, B.SECTOR_NAME, B.LONGITUDE, B.LATITUDE
           FROM user58db.`tbcell_traffic` AS A
                    INNER JOIN user58db.`1tbcell` AS B ON A.Sector_ID = B.SECTOR_ID
           WHERE (
               A.Hour BETWEEN 9 AND 11 OR A.Hour BETWEEN 19 AND 21
               )
             AND B.LATITUDE BETWEEN -90
               AND 90
             AND B.LONGITUDE BETWEEN 0
               AND 120
             AND str_to_date(A.Date, "%m/%d/%Y %H:%i:%s") BETWEEN str_to_date("05/01/2020", "%m/%d/%Y %H:%i:%s")
               AND str_to_date("5/31/2020", "%m/%d/%Y %H:%i:%s")
           GROUP BY A.SECTOR_ID)
SELECT MAX(t.s), MIN(t.s), AVG(t.s)
from t;
```

- 12.sql
```sql
SELECT A.SECTOR_ID, C.SECTOR_NAME, COUNT(B.N_SECTOR_ID) AS CNT
FROM user58db.`4tboptcell` AS A
         JOIN user58db.`2tbadjcell` AS B
         JOIN user58db.`1tbcell` AS C
              ON A.SECTOR_ID = B.S_SECTOR_ID AND A.SECTOR_ID = C.SECTOR_ID
WHERE A.CELL_TYPE = "优化区"
GROUP BY A.SECTOR_ID
HAVING COUNT(B.N_SECTOR_ID) > 10
ORDER BY CNT DESC
```

- 13.sql
```sql
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
```

- 14.sql
```sql
use user58db;
select `1tbcell`.SECTOR_ID, `1tbcell`.SECTOR_NAME, `1tbcell`.PCI, `5tbpciassignment`.PCI
from `1tbcell`,
     `4tboptcell`,
     `5tbpciassignment`
where `1tbcell`.SECTOR_ID = `5tbpciassignment`.SECTOR_ID
  and `1tbcell`.PCI = `5tbpciassignment`.PCI;
```

- 15_1.sql
```sql
use user58db;
select SECTOR_ID, SECTOR_NAME, HEIGHT
from `1tbcell`
where HEIGHT > some (select HEIGHT
                     from `1tbcell`
                     where 111 <= LONGITUDE <= 112
                       and 33.2 <= LATITUDE <= 33.6)
```

- 15_2.sql
```sql
use user58db;
select CellID, RSRP
from `6tbatudata`
where RSRP > some (select RSRP
                   from `6tbatudata`
                   where CellID in (select SECTOR_ID
                                    from `5tbpciassignment`
                                    where ENODEB_ID = 253903));
```

- 16_1.sql
```sql
use user58db;
select Sector_ID
from tbcell_traffic
group by Sector_ID
having sum(Traffic) >= all (select sum(Traffic)
                            from tbcell_traffic
                            group by Sector_ID)
```

- 16_2.sql
```sql
use user58db;
select SCELL, NCELL, HOATT
from `11tbhandover`
group by SCELL
having max(HOATT);

/*
where HOATT >= all (select HOATT
                    from `11tbhandover`);*/
```

- 17_1.sql
```sql
# mysql doesn't have not exists clause!
/*use user58db;
select SCELL, NCELL
from `11tbhandover`
where NCELL not exists (select NCELL
                    from `11tbhandover`
                    where NCELL in ('15290-128', '259595-1', '124711-0', '47444-1'))
*/

```

- 17_2.sql
```sql
# mysql doesn't have not exists clause!

/*use user58db;
select adj.S_SECTOR_ID
from `2tbadjcell` as adj,
     `3tbsecadjcel` as secadj
where not exists(select )*/
```

- 18.sql
```sql
# mysql doesn't have not unique clause!

use user58db;
select all SECTOR_ID
from `1tbcell`,
     `2tbadjcell`
where S_SECTOR_ID in (
    select SECTOR_ID
    from `1tbcell`
    where ENODEBID = 15114
)
  and N_SECTOR_ID = SECTOR_ID
group by SECTOR_ID
having count(SECTOR_ID) >= 2;



```

- 19.sql
```sql
use user58db;
select SECTOR_ID, aQF
from (select SECTOR_NAME, avg(QF) as aQF
      from `12tbcellkpi`
      group by SECTOR_NAME) as SNaQ,
     `1tbcell`
where aQF > 0.992
  and `1tbcell`.SECTOR_NAME = SNaQ.SECTOR_NAME;
```

- 20.sql
```sql
use user58db;
with avgQF(aQF, aNAME) as (select avg(QF), SECTOR_NAME
                           from `12tbcellkpi`
                           group by SECTOR_NAME)
select SECTOR_ID, avgQF.aQF
from `1tbcell`,
     avgQF
where avgQF.aQF > 0.992
  and `1tbcell`.SECTOR_NAME = avgQF.aNAME;
```

- 21.sql
```sql
use user58db;
with cSEC(SID, _count) as (select S_SECTOR_ID, count(N_SECTOR_ID)
                           from `2tbadjcell`
                           group by S_SECTOR_ID)
select SID, max(_count)
from cSEC,
     `1tbcell`;
```

- 22.sql
```sql
use user58db;
select count(*)
from `9tbmrodata`
group by TimeStamp, ServingSector, InterferingSector;
```

- 23.sql
```sql
use user58db;
select *
from `5tbpciassignment`
group by ENODEB_ID, PCI
having count(*) > 1
```

- 24.sql
```sql
INSERT INTO user58db.`2tbadjcell`
VALUES (124673 - 0, 5691 - 128, 38400, 38400);
```

- 25.sql
```sql
INSERT INTO user58db.`2tbadjcell`
SELECT B.S_SECTOR_ID, B.N_SECTOR_ID, NULL, NULL
FROM user58db.`3tbsecadjcel` AS B
WHERE B.S_SECTOR_ID = "124673-0";
```

- 26.sql
```sql
# select *
# from user58db.`11tbhandover`
# order by HOATT asc;
#
# insert into user58db.`11tbhandover`
# values ("h","h","h",0,0,0);

delete
from user58db.`11tbhandover`
where HOATT = (select min(HOATT) from (select * from user58db.`11tbhandover`) as x);
```

- 27.sql
```sql
update user58db.`1tbcell` AS a, user58db.`5tbpciassignment` as b
set a.PCI = b.PCI
where a.SECTOR_ID = b.SECTOR_ID;
```

- 28.sql
```sql
update user58db.`7tbatuc2i`
set RATIO_ALL = case
                    when (`RANK` >= 1 and COSITE = 1) then RATIO_ALL - 1
                    when COSITE != 1 then RATIO_ALL + 1
                    else RATIO_ALL
    end
where SECTOR_ID = "238397-1";
```

