--p10 implicit
set serveroutput on;
begin
    update emp set salary = salary + 5000 where deptno = 20;

    if sql%rowcount > 0 then
        dbms_output.put_line('salary updated successfully');
    else
        dbms_output.put_line('no record found');
    end if;

end;
/