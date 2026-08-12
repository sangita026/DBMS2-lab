--celsius
set serveroutput on;

declare
    celsius number := &celsius;
    fahrenheit number;
begin
    fahrenheit := (celsius * 9/5) + 32;

   dbms_output.put_line('Temperature in Celsius: ' || celsius || 'C');
     dbms_output.put_line('Temperature in Fahrenheit:'||fahrenheit||'F');
end;
/