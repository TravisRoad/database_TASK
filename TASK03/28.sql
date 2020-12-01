update user58db.`7tbatuc2i`
set RATIO_ALL = case
                    when (`RANK` >= 1 and COSITE = 1) then RATIO_ALL - 1
                    when COSITE != 1 then RATIO_ALL + 1
                    else RATIO_ALL
    end
where SECTOR_ID = "238397-1";