SET SERVEROUTPUT ON;

DECLARE
    v_salary EMP.SALARY%TYPE;

BEGIN
    SELECT SALARY
    INTO v_salary
    FROM EMP
    WHERE EMNAME = 'amit';

    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');

END;
/