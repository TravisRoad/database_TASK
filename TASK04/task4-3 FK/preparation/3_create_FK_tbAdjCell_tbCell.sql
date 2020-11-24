ALTER TABLE user60db.`2.tbadjcell`
add constraint PK_N_SECTOR_ID
foreign key(N_SECTOR_ID) references user60db.`1.tbcell`(SECTOR_ID)
