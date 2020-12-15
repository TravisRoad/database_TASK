use localuser58db;
SET transaction_isolation = 'repeatable-read';
select @@transaction_isolation;
start transaction;
select PCI from tbcellcopy where SECTOR_ID='124672-5';
