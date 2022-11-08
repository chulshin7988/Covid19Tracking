--house TABLE
INSERT INTO house VALUES(100, '400 Elmers Way, Baltimore MD', 21250);
INSERT INTO house VALUES(200, '5 Main Street, Columbia MD', 21044);
INSERT INTO house VALUES(300, '210 Spring Ave, Rockville MD', 20847);

--person TABLE
INSERT INTO person VALUES(1,100,'Max',1111233437, 0);
INSERT INTO person VALUES(2,200,'Ruby',2013454567,1);
INSERT INTO person VALUES(3, 300, 'Eva', 410789487, null);
INSERT INTO person VALUES(4,200,'Elaine',3115497517,0);
INSERT INTO person VALUES(5,200,'Roxanne',4915439527,1);

--test_table TABLE
INSERT INTO test_table VALUES(10,1,date '2021-3-7',0);
INSERT INTO test_table VALUES(20,2,date '2021-3-4',1);
INSERT INTO test_table VALUES(30,2,date '2021-3-20',1);
INSERT INTO test_table VALUES(40,4,date '2021-2-20',1);
INSERT INTO test_table VALUES(50,4,date '2021-3-14',0);
INSERT INTO test_table VALUES(60,5,date '2021-3-29',1);

--event TABLE
INSERT INTO event VALUES(706,'comedy show',date '2021-3-16', '3029 Wonder Park Way Baltimore MD', 21025);
INSERT INTO event VALUES(809,'party', date '2021-5-20', '4782 Willow Street Columbia MD', 21044);
INSERT INTO event VALUES(901,'music festival',date '2021-4-30', '1540 Columbia Rd Washington DC', 20009);

--person_event TABLE
INSERT INTO person_event VALUES(1,706);
INSERT INTO person_event VALUES(2,809);
INSERT INTO person_event VALUES(3,901);
INSERT INTO person_event VALUES(4,706);
INSERT INTO person_event VALUES(5,706);

--flight TABLE
INSERT INTO flight VALUES(1000,date '2021-3-21', 'DL 276');
INSERT INTO flight VALUES(2000,date '2021-4-17', 'AAL 425');
INSERT INTO flight VALUES(3000,date '2021-5-14', 'SWA 798');

--person_flight TABLE
INSERT INTO person_flight VALUES(1,1000);
INSERT INTO person_flight VALUES(2,2000);
INSERT INTO person_flight VALUES(3,3000);
INSERT INTO person_flight VALUES(4,2000);
INSERT INTO person_flight VALUES(5,1000);