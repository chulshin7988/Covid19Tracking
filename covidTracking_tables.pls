DROP TABLE person_flight CASCADE CONSTRAINTS;
DROP TABLE flight CASCADE CONSTRAINTS;
DROP TABLE person_event CASCADE CONSTRAINTS;
DROP TABLE event CASCADE CONSTRAINTS;
DROP TABLE test_table CASCADE CONSTRAINTS;
DROP TABLE person CASCADE CONSTRAINTS;
DROP TABLE house CASCADE CONSTRAINTS;

CREATE TABLE house(
    hid INT NOT NULL, --house ID
    house_add VARCHAR(30) NOT NULL, --house address
    h_zip INT NOT NULL, --zip code
    PRIMARY KEY(hid)
);

CREATE TABLE person(
    pid INT NOT NULL, --person ID
    hid INT NOT NULL,
    p_name VARCHAR(10), --person's name
    phone_num INT, --phone number
    rec_stat INT, --most recent test status, 1 = positive, 0 = currently negative, null = unknown
    PRIMARY KEY(pid),
    FOREIGN KEY(hid) REFERENCES house(hid)
);

CREATE TABLE test_table(
tid INT NOT NULL, --test ID
pid INT NOT NULL,
test_date DATE, --date test was taken
test_Result INT, --(1 means positive and 0 negative)
PRIMARY KEY (tid),
FOREIGN KEY (pid) REFERENCES person(pid)
);

CREATE TABLE event(
eid INT NOT NULL, --event ID
e_name VARCHAR(20), --name of event
e_date DATE, --date of event
e_address VARCHAR(60), --event address
e_zip INT,
Primary key(eid)
);

CREATE TABLE person_event(
Pid INT NOT NULL,
eid INT NOT NULL,
PRIMARY KEY(pid, eid),
FOREIGN KEY(pid) REFERENCES person(pid),
FOREIGN KEY(eid) REFERENCES event(eid)
);

CREATE TABLE flight(
fid INT NOT NULL, --flight ID
flight_date DATE,
flight_num VARCHAR(20),--e.g., 'DL 345' is a delta 345 flight
PRIMARY KEY(fid)
);

CREATE TABLE person_flight(
Pid INT NOT NULL,
Fid INT NOT NULL,
PRIMARY KEY(pid, fid),
FOREIGN KEY(pid) REFERENCES person(pid),
FOREIGN KEY(fid) REFERENCES flight(fid)
);