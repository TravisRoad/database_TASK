SELECT N_SECTOR_ID
FROM user60db.`2.tbadjcell`
WHERE N_SECTOR_ID not in(SELECT SECTOR_ID
						FROM user60db.`1.tbcell`
						)
                        