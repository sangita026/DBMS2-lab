SET SERVEROUTPUT ON;

DECLARE
    xrlno NUMBER(2) := &xrlno;
    xm1 NUMBER(3);
    xm2 NUMBER(3);
    xm3 NUMBER(3);
    xm4 NUMBER(3);
    xm5 NUMBER(3);
    tot NUMBER(4);
    p NUMBER(5,2);

BEGIN
    SELECT m1, m2, m3, m4, m5
    INTO xm1, xm2, xm3, xm4, xm5
    FROM mid1
    WHERE rlno = xrlno;

    tot := xm1 + xm2 + xm3 + xm4 + xm5;
    p := tot / 5;

    IF xm1 > 40 AND xm2 > 40 AND xm3 > 40 AND xm4 > 40 AND xm5 > 40 THEN

        IF p >= 40 AND p < 50 THEN
            UPDATE mid1
            SET total = tot, per = p, result = 'Pass', grade = 'D'
            WHERE rlno = xrlno;

        ELSIF p >= 50 AND p < 60 THEN
            UPDATE mid1
            SET total = tot, per = p, result = 'Pass', grade = 'C'
            WHERE rlno = xrlno;

        ELSIF p >= 60 AND p < 70 THEN
            UPDATE mid1
            SET total = tot, per = p, result = 'Pass', grade = 'B'
            WHERE rlno = xrlno;

        ELSIF p >= 70 AND p <= 100 THEN
            UPDATE mid1
            SET total = tot, per = p, result = 'Pass', grade = 'A'
            WHERE rlno = xrlno;

        ELSE
            UPDATE mid1
            SET total = tot, per = p, result = 'Fail', grade = 'F'
            WHERE rlno = xrlno;
        END IF;

    ELSE
        UPDATE mid1
        SET total = tot, per = p, result = 'Fail', grade = 'F'
        WHERE rlno = xrlno;
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Record Updated Successfully.');

END;
/