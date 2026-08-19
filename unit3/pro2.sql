SET SERVEROUTPUT ON;

DECLARE
    v_name   RESULT.student_name%TYPE;
    v_result RESULT.result%TYPE;

BEGIN
    -- Accept student name from the user
    v_name := '&student_name';

    -- Search for the student's result
    SELECT result
    INTO v_result
    FROM RESULT
    WHERE UPPER(student_name) = UPPER(v_name);

    -- Display result
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No result found for student: ' || v_name);

    
END;
/