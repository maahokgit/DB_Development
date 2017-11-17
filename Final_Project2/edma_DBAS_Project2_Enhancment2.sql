/*  
Author: Edward Ma
Student ID: W0057568

Data Migration Project.
Enhancement #2

Alter Customer Table by adding a Unique ID in Numeric value, while retaining old 
ID in 3 to 4 Alpha Code.

Dropping previous primary key, and replacing CustomerUID as new Primary Key
as well as replacing Orders Table CustomerID to CustomerUID as the new Foreign Key
*/

-- add new CustomerUID for Customer Unique ID to table
ALTER TABLE Customers
ADD (CustomerUID NUMBER);

--ALTER TABLE Customers
--DROP (CustomerUID);

-- create sequence and add integer to the new Unique ID Field.
CREATE SEQUENCE s START WITH 1 INCREMENT BY 1;

UPDATE Customers
SET Customers.CustomerUID = s.nextval;
--DROP SEQUENCE s; --incase you need to start over!
-- Alter Orders Table and add new Customer Unique ID
ALTER TABLE Orders
ADD (CustomerUID NUMBER NULL);

-- update Orders CustomersUID

MERGE INTO Orders o
USING (
      SELECT * FROM Customers
      ) c 
ON (c.CUSTOMERID = o.CUSTOMERID)
WHEN MATCHED THEN UPDATE
SET o.CUSTOMERUID = c.CUSTOMERUID;
-- drop constraint in orders and customers table and make new CustomerUID as PK, and FK
ALTER TABLE Orders
DROP CONSTRAINT FK_ORDERS_CUSTOMERS;

ALTER TABLE Customers
DROP CONSTRAINT PK_Customers;

ALTER TABLE Customers
ADD (CONSTRAINT PK_Customers PRIMARY KEY (CustomerUID));

DESC Customers;

ALTER TABLE Orders
ADD (CONSTRAINT FK_ORDERS_CUSTOMERS FOREIGN KEY (CustomerUID) REFERENCES Customers(CustomerUID));

-- test script to make sure it matchs
--SELECT DISTINCT o.CUSTOMERID,
--                c.CUSTOMERID,
--                o.CUSTOMERUID,
--                c.CUSTOMERUID
--FROM  Orders o
--LEFT OUTER JOIN Customers c ON c.customerUID = o.customerUID
--WHERE o.CustomerUID IS NOT NULL
--ORDER BY o.CustomerUID ASC;
-- Result should match each other.