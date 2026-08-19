SET SERVEROUTPUT ON;

DECLARE
    v_name   EMP.EMNAME%TYPE;
    v_salary EMP.SALARY%TYPE;

BEGIN
    -- Accept employee name from user
    v_name := '&EMNAME';

    -- Search employee and get salary
    SELECT SALARY
    INTO v_salary
    FROM EMPLOYEE
    WHERE UPPER(EMNAME) = UPPER(v_name);

    -- Display salary
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee does not exist.');

    
END;
/