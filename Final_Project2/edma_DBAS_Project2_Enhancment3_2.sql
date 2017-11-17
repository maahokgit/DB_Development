/*  
Author: Edward Ma
Student ID: W0057568

Data Migration Project.
Enhancement #3 Part 2

Updating Customers, Orders, Suppliers, and Employees Table
with the new Alpha-3 Country Code.

I need to make a new Column, put the Alpha-3 Code in that, drop previous
County Column, and rename new Column to previous country column and references 
it to the Country Table as a Foreign Key.

*/

-- Updating Order Table by inserting new SHIPCOUNTRYID
ALTER TABLE Orders
ADD ShipCountryID CHAR(3);

-- update ShipCountryID To CountryID
MERGE INTO Orders o
USING (
      SELECT * FROM Country
      ) c 
ON (LOWER(c.COUNTRYNAME) = LOWER(o.SHIPCOUNTRY))
WHEN MATCHED THEN UPDATE
SET o.SHIPCOUNTRYID = c.COUNTRYID;

--Test Script to make sure it is working
--SELECT 
--  DISTINCT 
--    Orders.ShipCountryID,
--    Country.CountryID,
--    Orders.ShipCountry,
--    Country.CountryName 
--FROM Orders, Country
--WHERE Orders.SHIPCOUNTRYID = Country.COUNTRYID;
-- Result should match.

-- Droping ShipCountry Column, and Renaming ShipCountryID to ShipCountry
ALTER TABLE Orders
DROP COLUMN ShipCountry;

ALTER TABLE Orders
RENAME COLUMN ShipCountryID
TO ShipCountry;

-- Testing again to see if I mess it up.
--SELECT 
--  DISTINCT
--    Orders.ShipCountry,
--    Country.CountryID,
--    Country.CountryName
--FROM Orders, Country
--WHERE Orders.SHIPCOUNTRY = Country.COUNTRYID;
-- Result should match. In
              
-- Create Foreign KEY
ALTER TABLE Orders
ADD (
    CONSTRAINT FK_Orders_Country 
    FOREIGN KEY (ShipCountry) 
    REFERENCES Country (CountryID)
    );

/*====================================================================================== */    
-- Updating Customers Table by inserting new COUNTRYID, update it, drop it, and rename it back to country
ALTER TABLE Customers
ADD COUNTRYID CHAR(3);

-- update CountryID To CountryID
MERGE INTO Customers o
USING (
      SELECT * FROM Country
      ) c 
ON (LOWER(c.COUNTRYNAME) = LOWER(o.COUNTRY))
WHEN MATCHED THEN UPDATE
SET o.COUNTRYID = c.COUNTRYID;

--Test Script to make sure it is working
--SELECT 
--  DISTINCT 
--    Customers.CountryID,
--    Country.CountryID,
--    Customers.Country,
--    Country.CountryName 
--FROM Customers, Country
--WHERE Customers.COUNTRYID = Country.COUNTRYID;
-- Result should match

-- Droping Country Column, and Renaming CountryID to ShipCountry
ALTER TABLE Customers
DROP COLUMN COUNTRY;

ALTER TABLE Customers
RENAME COLUMN COUNTRYID
TO COUNTRY;

-- Testing again to see if I mess it up.
--SELECT 
--  DISTINCT
--    Customers.Country,
--    Country.CountryID,
--    Country.CountryName
--FROM Customers, Country
--WHERE Customers.COUNTRY = Country.COUNTRYID;
-- Result should match.

-- Create Foreign KEY
ALTER TABLE Customers
ADD (
    CONSTRAINT FK_Customers_Country 
    FOREIGN KEY (COUNTRY)
    REFERENCES Country (CountryID)
    );
    
/*====================================================================================== */
-- Updating Customers Table by inserting new COUNTRYID, update it, drop it, and rename it back to country
ALTER TABLE Suppliers
ADD COUNTRYID CHAR(3);

-- update CountryID To CountryID
MERGE INTO Suppliers o
USING (
      SELECT * FROM Country
      ) c 
ON (LOWER(c.COUNTRYNAME) = LOWER(o.COUNTRY))
WHEN MATCHED THEN UPDATE
SET o.COUNTRYID = c.COUNTRYID;

--Test Script to make sure it is working
--SELECT 
--  DISTINCT 
--    Suppliers.CountryID,
--    Country.CountryID,
--    Suppliers.Country,
--    Country.CountryName 
--FROM Suppliers, Country
--WHERE Suppliers.COUNTRYID = Country.COUNTRYID;
-- Result should match

-- Droping Country Column, and Renaming CountryID to Country
ALTER TABLE Suppliers
DROP COLUMN COUNTRY;

ALTER TABLE Suppliers
RENAME COLUMN COUNTRYID
TO COUNTRY;

-- Test Script to make sure it's working
-- Testing again to see if I mess it up.
--SELECT 
--  DISTINCT
--    Suppliers.Country,
--    Country.CountryID,
--    Country.CountryName
--FROM Suppliers, Country
--WHERE Suppliers.COUNTRY = Country.COUNTRYID;
-- Result should match.

-- Create Foreign KEY
ALTER TABLE Suppliers
ADD (
    CONSTRAINT FK_Suppliers_Country 
    FOREIGN KEY (COUNTRY)
    REFERENCES Country (CountryID)
    );
    
/*====================================================================================== */
-- Updating Customers Table by inserting new COUNTRYID, update it, drop it, and rename it back to country
ALTER TABLE Employees
ADD COUNTRYID CHAR(3);

-- update CountryID To CountryID
MERGE INTO Employees o
USING (
      SELECT * FROM Country
      ) c 
ON (LOWER(c.COUNTRYNAME) = LOWER(o.COUNTRY))
WHEN MATCHED THEN UPDATE
SET o.COUNTRYID = c.COUNTRYID;

--Test Script to make sure it is working
--SELECT 
--  DISTINCT 
--    Employees.CountryID,
--    Country.CountryID,
--    Employees.Country,
--    Country.CountryName 
--FROM Employees, Country
--WHERE Employees.COUNTRYID = Country.COUNTRYID;
-- Result should match

-- Droping Country Column, and Renaming CountryID to Country
ALTER TABLE Employees
DROP COLUMN COUNTRY;

ALTER TABLE Employees
RENAME COLUMN COUNTRYID
TO COUNTRY;

-- Test Script to make sure it's working
-- Testing again to see if I mess it up.
--SELECT 
--  DISTINCT
--    Suppliers.Country,
--    Country.CountryID,
--    Country.CountryName
--FROM Suppliers, Country
--WHERE Suppliers.COUNTRY = Country.COUNTRYID;
-- Result should match.

-- Create Foreign KEY
ALTER TABLE Employees
ADD (
    CONSTRAINT FK_Employees_Country 
    FOREIGN KEY (COUNTRY)
    REFERENCES Country (CountryID)
    );