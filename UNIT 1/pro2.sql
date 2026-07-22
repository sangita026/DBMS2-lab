SET SERVEROUTPUT ON;

declare
    num NUMBER := &num;
    sq  NUMBER;
    cube NUMBER;
begin
    sq := num * num;
    cube := num * num * num;

   dbms_output.put_line('Given Number : ' || num);
    dbms_output.put_line('Square       : ' || sq);
    dbms_output.put_line('Cube         : ' || cube);
end;
/