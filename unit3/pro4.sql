SET SERVEROUTPUT ON;

DECLARE
    v_name   EMP.EMNAME%TYPE;
    v_salary EMP.SALARY%TYPE;

BEGIN
    SELECT EMNAME, SALARY
    INTO v_name, v_salary
    FROM EMP
    WHERE AGE = 50;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found whose age is 50.');

  

END;
/