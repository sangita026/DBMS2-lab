set serveroutput on
declare
	n1 number(3):=&n1;
	n2 number(3):=&n2;
	d number(5);
begin
	dbms_output.put_line('value1'||n1);		
	dbms_output.put_line('value2'||n2);

	d := n1 / n2;
	dbms_output.put_line('Answer'||d);

	EXCEPTION
		WHEN ZERO_DIVIDE THEN
		dbms_output.put_line('no 2 should be>0');

end;
/