--defination 2
create or replace trigger program2 
before Insert on emp_sal 
for each row
begin
	if:NEW.salary > 50000 then
	Raise_application_error(-20010,'you cant enter salary above 50000');
	end if;
end program2;
/