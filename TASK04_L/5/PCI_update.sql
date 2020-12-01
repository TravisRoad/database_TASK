use user58db;
delimiter $
create trigger PCI_update
before update on user58db.tbcellcopy for each row
begin
if new.PCI not between 0 and 503 then
	signal sqlstate '45000' set message_text = 'The PCI is wrong';
else
	set new.PSS = new.PCI % 3;
    set new.SSS = new.PCI / 3;
end if;
end $
delimiter ;