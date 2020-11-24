SELECT SECTOR_ID, count(*)
FROM user60db.tbcellcopy
GROUP BY SECTOR_ID
	HAVING count(*) > 1
