SELECT ENODEBID,ENODEB_NAME
FROM user58db.`1tbcell`
WHERE LATITUDE in (
	SELECT MAX(LATITUDE) as LATITUDE
	FROM user58db.`1tbcell`
);