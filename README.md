# Covid19Tracking

This project was to develop a database system of a contact tracing system for COVID. 
The database was designed, some sample data was inserted and set of required features were implemented.

Each feature was implemented as one or more Oracle PL/SQL PROCEDURES or FUNCTIONS.

Assumptions:
1. The database stores information about houses, each with a house ID, address, and zip code.
2. The database stores information about person, including person ID, house ID where the person lives, person name, phone number, and status where 1 means currently tested positive, 0 means currently tested negative, and NULL.
3. The database stores information about a person's all past tests, including person ID, test date and result.
4. The database stores information about events. Each event has an event ID, event name, date, and address.

Required Features:
1. Add a house to the database. Input includes house address and zip code.
2. Add a person to an existing house, including name of person, house ID, phone number and set status to NULL.
3. Enter a new test result. Input includes person ID, test date and test result.
4. Enter a new event including date, name and address. Check whether the same event exists with the same name, date and address.

The codes are based on PL/SQL codes and all were saved as .pls extension file which were worked in ORACLE.
