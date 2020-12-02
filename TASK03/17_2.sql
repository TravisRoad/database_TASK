# mysql doesn't have not exists clause!

/*use user58db;
select adj.S_SECTOR_ID
from `2tbadjcell` as adj,
     `3tbsecadjcel` as secadj
where not exists(select )*/

use user58db;
SELECT DISTINCT a.S_SECTOR_ID
FROM `2tbadjcell` AS a
WHERE NOT EXISTS (
  SELECT DISTINCT s.S_SECTOR_ID
  FROM `2tbadjcell` AS s
  WHERE s.S_SECTOR_ID = a.S_SECTOR_ID AND s.N_SECTOR_ID NOT IN (
    SELECT DISTINCT d.N_SECTOR_ID
    FROM `2tbadjcell` AS d
    WHERE d.S_SECTOR_ID = a.S_SECTOR_ID )) OR
NOT EXISTS (
  SELECT DISTINCT j.S_SECTOR_ID
  FROM `3tbsecadjcel` AS j
  WHERE j.S_SECTOR_ID = a.S_SECTOR_ID AND j.N_SECTOR_ID NOT IN (
    SELECT DISTINCT e.N_SECTOR_ID
    FROM `2tbadjcell` AS e
    WHERE e.S_SECTOR_ID = a.S_SECTOR_ID ))