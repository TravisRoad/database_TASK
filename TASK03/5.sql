(SELECT SECTOR, SECTOR_NAME
 FROM user58db.`12tbcellkpi`
 WHERE QF > 0.95)
UNION ALL
(SELECT SECTOR, SECTOR_NAME
 FROM user58db.`12tbcellkpi`
 WHERE ERABf > 0.99)