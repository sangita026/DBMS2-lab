set serveroutput on;

declare
    cursor c1 is select empid, empname, deptno, salary from emp where deptno = 20;

    x_empid emp.empid%type;
    x_empname emp.empname%type;
    x_deptno emp.deptno%type;
    x_salary emp.salary%type;
    x_count number := 0;
begin
    open c1;

    if c1%isopen then
        dbms_output.put_line('cursor is open');
    end if;

    loop
        fetch c1 into x_empid, x_empname, x_deptno, x_salary;

        exit when c1%notfound;
	update emp
        set salary = salary + (salary * 5 / 100)
        where empid = x_empid;

        insert into emp_update values (x_empid, x_empname, x_deptno, x_salary + (x_salary * 5 / 100));

        x_count := x_count + 1;

    end loop;

    if x_count > 0 then
        dbms_output.put_line(x_count || ' employee(s) got 5% raise');
    else
        dbms_output.put_line('no employee found in department 20');
    end if;

    close c1;

    if not c1%isopen then
        dbms_output.put_line('cursor is closed');
    end if;

end;
/