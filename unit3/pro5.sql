SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS
        SELECT eid, ename, deptno, salary
        FROM emp
        WHERE deptno = &dept_no;

    no_dept_found EXCEPTION;
    v_count NUMBER := 0;

BEGIN
    FOR emp_rec IN c_emp LOOP

        INSERT INTO emp_backup
        VALUES (
            emp_rec.eid,
            emp_rec.ename,
            emp_rec.deptno,
            emp_rec.salary
        );

        v_count := v_count + 1;

    END LOOP;

    IF v_count = 0 THEN
        RAISE no_dept_found;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        v_count || ' record(s) inserted into EMP_BACKUP.'
    );

EXCEPTION
    WHEN no_dept_found THEN
        DBMS_OUTPUT.PUT_LINE(
            'NO_DEPT_FOUND: No employees found for entered DEPT_NO.'
        );
END;
/