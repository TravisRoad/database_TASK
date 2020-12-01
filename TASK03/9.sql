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