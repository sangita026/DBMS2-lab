SET SERVEROUTPUT ON;

declare
    feet   number := &feet;
    cm     number;
    inch  number;
    meter  number;
begin
    cm := feet * 30.48;
    inch := feet * 12;
    meter := feet * 0.3048;

   dbms_output.put_line('Measurement in Feet : ' || feet);
   dbms_output.put_line('Centimeters:'||cm);
    dbms_output.put_line('Inches:'||inch);
    dbms_output.put_line('Meters:'||meter);
end;
/