SELECT
  ONE.SECTOR_ID,
  SECTOR_NAME,
  NCELL_ID,
  NSECTOR_ID
FROM
  (
    (
      select
        *
      FROM
        user58db.`7tbatuc2i` AS A
        INNER JOIN user58db.`8tbatuhandover` AS B ON A.SECTOR_ID = B.NSECTOR_ID
      WHERE
        SECTOR_ID = "238397-1"
        and COSITE = 1
    ) AS TMP
    INNER JOIN user58db.`1tbcell` AS ONE ON TMP.SECTOR_ID = ONE.SECTOR_ID
  );