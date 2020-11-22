select
  *
from 
  `2.tbadjcell` as a inner join `3.tbsecadjcel` as b
  on a.S_SECTOR_ID=b.S_SECTOR_ID and a.N_SECTOR_ID=b.N_SECTOR_ID;