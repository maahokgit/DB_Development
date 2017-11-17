/*  
Author: Edward Ma
Student ID: W0057568

Data Migration Project.
Enhancement #4

Add new column for HR name HR_NAME, and insert new data to it that is a combination
of Title + FirstName + LastName

ex. 
if FirstName = Edward, LastName = Ma, Title of Courtesy = Dr.
The result of the new field should be Dr. Edward Ma
*/

/*
to found out datatpe and max byte I need for the new Column
by adding total varchar bye of FirstName, Lastname and Title of Courtesy
*/
DESC Employees;

/* Result
LASTNAME        NOT NULL VARCHAR2(20)  
FIRSTNAME       NOT NULL VARCHAR2(10)  
TITLEOFCOURTESY          VARCHAR2(25)  

new HR_Name will have VARCHAR(55)
*/

-- Alter Table adding new HR_Name for the HR new Software.

ALTER TABLE Employees
ADD (HR_Name AS (TitleOfCourtesy||' '||FirstName||' '||LastName));

-- Test script to see if it work correctly
--SELECT Employees.TITLEOFCOURTESY, Employees.FIRSTNAME, Employees.LASTNAME, Employees.HR_NAME
--FROM Employees
--ORDER BY Employees.LASTNAME ASC;
-- and the result show that it is.

-- testing new Employee Table with new entry
--INSERT INTO EMPLOYEES(EmployeeID, TITLEOFCOURTESY, FirstName, LastName) VALUES (10, 'Dr.', 'Edward', 'Ma');
--
--SELECT Employees.HR_Name FROM Employees WHERE EmployeeID = 10;
--
--DELETE FROM Employees WHERE EmployeeID = 10;