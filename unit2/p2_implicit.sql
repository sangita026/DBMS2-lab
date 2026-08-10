--p2 implicit
set serveroutput on;
declare
    x_count number;
begin
    update emp set salary = salary + (salary * 5 / 100) where deptno = 20;
	x_count := sql%rowcount;
	if x_count > 0 then
        dbms_output.put_line('salary updated successfully');
        dbms_output.put_line(x_count || ' employee(s) got 5% raise');

        insert into emp_update select empid, empname, deptno, salary from emp where deptno = 20;
 else
        dbms_output.put_line('no employee found in department 20');
    end if;
end;
/