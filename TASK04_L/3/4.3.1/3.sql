Alter table user58db.`2tbadjcell`
    Add constraint FK_N_SECTOR_ID
        foreign key (N_SECTOR_ID) references user58db.tbcellcopy (SECTOR_ID);
