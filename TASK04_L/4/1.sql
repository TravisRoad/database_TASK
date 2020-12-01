SELECT DISTINCT a.ENODEBID, a.LONGITUDE, a.LATITUDE, b.LONGITUDE, b.LATITUDE
FROM user58db.tbcellcopy as a,
     user58db.tbcellcopy as b
WHERE a.ENODEBID = b.ENODEBID
  and a.LONGITUDE != b.LONGITUDE
  and a.LATITUDE != b.LATITUDE;

SELECT DISTINCT a.ENODEBID, a.LONGITUDE, a.LATITUDE, b.LONGITUDE, b.LATITUDE
FROM user58db.tbcellcopy as a,
     user58db.tbcellcopy as b
WHERE a.ENODEBID = b.ENODEBID
  and abs(a.LONGITUDE - b.LONGITUDE) > 0.1
  and abs(a.LATITUDE - b.LATITUDE) > 0.1;

