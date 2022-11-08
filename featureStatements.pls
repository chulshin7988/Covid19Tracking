--FEATURE #1 : Add a house to the database
DROP SEQUENCE hid_seq;
CREATE SEQUENCE hid_seq START WITH 301;
CREATE OR REPLACE PROCEDURE addHouse(haddress IN VARCHAR, zih IN INTEGER) IS
Ha_check NUMBER;
BEGIN
--checks if the house already exists
SELECT COUNT(*) INTO ha_check 
FROM house 
WHERE house_add = haddress AND h_zip = zih;
IF ha_check = 0 THEN
--house does not exist. Inserts the values and adds a new house ID
INSERT INTO house VALUES
    (hid_seq.NEXTVAL, haddress, zih);
dbms_output.put_line('New House ID:' || hid_seq.CURRVAL);
ELSE
--house already exists. Prints this out
dbms_output.put_line('The house already exist!');
END IF;
END;
SET SERVEROUTPUT ON;
--FEATURE #1 TEST CASE
--#1 : works since the address is not already in the database
EXEC addHouse('10210 Castlehill Ct', 21042);
--#2 : special case calling that the house already exists since the address is already in the database
EXEC addHouse('10210 Castlehill Ct', 21042);


--FEATURE #2 : Add a person to an existing house
DROP SEQUENCE pid_seq;
CREATE SEQUENCE pid_seq START WITH 6;
CREATE OR REPLACE PROCEDURE addPerson(personName IN VARCHAR, IDhouse IN INT, num_phone IN INT) IS
hid_check NUMBER;
per_check NUMBER;
perStat NUMBER;
BEGIN
perStat := NULL;
--checks if there is an existing person with the same name and phone number
SELECT COUNT(*) INTO per_check
FROM person
WHERE personName = pname AND num_phone = phone_num;
IF per_check != 0 THEN
--person has both these things. Prints this out
dbms_output.put_line('Person already exists!');
ELSE
--checks if the house exists
SELECT COUNT(*) INTO hid_check
FROM house
WHERE hid = IDhouse;
IF hid_check = 0 THEN
--house does not exist. Prints this out
dbms_output.put_line('No such house!');
ELSE
--prints out row with null status
INSERT INTO person VALUES
    (pid_seq.NEXTVAL, IDhouse, personName, num_phone, perStat);
dbms_output.put_line(pid_seq.CURRVAL || ':' || IDhouse || ':' || personName || ':' || num_phone || ':' || perStat);
END IF;
END IF;
END;
SET SERVEROUTPUT ON;

--FEATURE #2 TEST CASE
--#1 : works since Emily is not in the database and a house exists with ID 200
EXEC addPerson('Emily', 2, 4102364357);
--#2 : calls that the house does not exist since no house has ID of 10
EXEC addPerson('Lily', 10, 4107485364);


--FEATURE #3 : Enter a new test result
DROP SEQUENCE tid_seq;
CREATE SEQUENCE tid_seq START WITH 70;
CREATE OR REPLACE PROCEDURE addResult(personID IN NUMBER, given_date IN DATE, tstResult IN NUMBER) IS
test_check NUMBER;
person_check NUMBER;
BEGIN
SELECT COUNT(*) INTO person_check
FROM person
WHERE pid = personID;
IF person_check = 0 THEN
dbms_output.put_line('This ID is not valid!');
ELSE
SELECT COUNT(*) INTO test_check
FROM test_table WHERE test_date = given_date;
IF test_check !=0 THEN
UPDATE test_table
SET test_result = tstResult
WHERE test_date = given_date;
ELSE
INSERT INTO test_table VALUES
    (tid_seq.NEXTVAL, personID, given_date, tstResult);
dbms_output.put_line(tid_seq.CURRVAL || ':' || personID || ':' || given_date || ':' || tstResult);
END IF;
END IF;
END;
SET SERVEROUTPUT ON;

--FEATURE #3 TEST CASE
--#1 : person 1 is in the database and has the same result as last time
EXEC addResult(1, '07-mar-2021', 0);
--#2 : person 65 does not exist in the database
EXEC addResult(65, '07-mar-2021', 1);
--#3 : updates person 1's test result
EXEC addResult(1, '07-mar-2021', 1);