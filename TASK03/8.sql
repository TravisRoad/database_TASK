select
  *
from 
  user58db.`2tbadjcell` as a inner join user58db.`3tbsecadjcel` as b
  on a.S_SECTOR_ID=b.S_SECTOR_ID and a.N_SECTOR_ID=b.N_SECTOR_ID;