--FEATURE #4 : Enter a new event including date, name and address
DROP SEQUENCE eid_seq;
CREATE SEQUENCE eid_seq START WITH 1001;
CREATE OR REPLACE PROCEDURE addEvent(v_ename IN VARCHAR, v_edate IN DATE, v_eaddress IN VARCHAR, v_ezip IN INT) IS
e_check NUMBER;
BEGIN
--check if event already exists
SELECT COUNT(*) INTO e_check
FROM event e
WHERE e.ename = v_ename AND e.edate = v_edate AND e.eaddress = v_eaddress;
IF e_check != 0 THEN
dbms_output.put_line('The event already exists!');
ELSE
INSERT INTO event VALUES
    (eid_seq.NEXTVAL, v_ename, v_edate, v_eaddress, v_ezip);
    dbms_output.put_line('Event ID:' || eid_seq.CURRVAL);
END IF;
END;
SET SERVEROUTPUT ON;

--FEATURE #4 TEST CASE
--#1 : the data gets inserted into the table and prints out the event ID
EXEC addEvent('magic show', DATE '2021-7-10','3099 Wonderstar Way Annapolis MD', 21038);


--FEATURE #5 : Print out test dates and test results for the person
CREATE OR REPLACE PROCEDURE print_test(p_pname person.pname%TYPE, p_phone_num person.phone_num%TYPE) IS
CURSOR c1 IS
SELECT t.test_date, t.test_result
FROM test_table t
INNER JOIN person p
    ON p.pid = t.pid
WHERE pname = p_pname AND phone_num = p_phone_num;
t_TestDate test_table.test_date%TYPE;
t_TestResult test_table.test_result%TYPE;
t_count INT;
BEGIN
SELECT COUNT(*) INTO t_count
FROM person
WHERE pname = p_pname;
IF t_count = 0 THEN
dbms_output.put_line('Testdate: ' || t_TestDate || 'Test Result: ' || t_TestResult);
END LOOP;
CLOSE c1;
END IF;
END;
SET SERVEROUTPUT ON;

--FEATURE #5 TEST CASE
EXEC print_test('Max', '1111233437');


--FEATURE #6 : Print out accumulated number of positive cases by input date
CREATE OR REPLACE FUNCTION positiveCase(tdate test_table.test_date%TYPE)
RETURN NUMBER IS
case_cout NUMBER;
BEGIN
SELECT COUNT(tid) INTO case_count
FROM test_table
WHERE test_result = 1 AND test_date < tdate;
RETURN case_count
END;
SET SERVEROUTPUT ON;
-- TEST CASE
DECLARE
case_count 1 NUMBER;
BEGIN
case_count1 := positiveCase(DATE '2021-3-19');
dbms_output.put_line('Results are: ' || case_count1);
END;
