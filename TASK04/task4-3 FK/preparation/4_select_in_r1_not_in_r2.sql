SELECT SECTOR_ID
FROM user60db.`1.tbcell`
WHERE SECTOR_ID not in(SELECT N_SECTOR_ID
						FROM user60db.`2.tbadjcell`
                        )
                        