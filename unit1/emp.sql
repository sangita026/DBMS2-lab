--emp
set serveroutput on;
declare
	eno number(4):=&eno;
	enm char(10):='&enm';
	dpt number(10):=&dpt;
	sal number(15):=&sal;

begin
	insert into emp VALUES(eno,enm,dpt,sal);
commit;
dbms_output.put_line('insert the data');

end;
/