SET SERVEROUTPUT ON;

DECLARE
    xeid NUMBER := &eid;
    xname VARCHAR2(20);
    xbasic NUMBER;
    hra NUMBER;
    da NUMBER;
    medical NUMBER := 500;
    pf NUMBER;
    gross NUMBER;

BEGIN
    SELECT ename, basicsal
    INTO xname, xbasic
    FROM employee
    WHERE eid = xeid;

    hra := xbasic * 15/100;
    da := xbasic * 50/100;
    pf := xbasic * 10/100;

    gross := (xbasic + hra + da + medical) - pf;

    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || xname);
    DBMS_OUTPUT.PUT_LINE('Basic Salary  : ' || xbasic);
    DBMS_OUTPUT.PUT_LINE('Gross Salary  : ' || gross);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');
END;
/