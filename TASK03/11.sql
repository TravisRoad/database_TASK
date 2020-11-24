-- 最大值得相关信息
with t as(SELECT sum(A.Traffic) as s, A.Sector_ID, B.SECTOR_NAME, B.LONGITUDE, B.LATITUDE
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
select max(s) as MAX,t.Sector_ID, t.SECTOR_NAME, t.LATITUDE, t.LONGITUDE
from t
WHERE s = (SELECT MAX(t.s) from t);

-- 最大最小平均
with t as(SELECT sum(A.Traffic) as s, A.Sector_ID, B.SECTOR_NAME, B.LONGITUDE, B.LATITUDE
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
SELECT MAX(t.s),MIN(t.s),AVG(t.s) from t;