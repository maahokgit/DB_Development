/*
Author: Edward Ma
DBAS Project 2

Creating Tables needed, and adding PK and FK to each table 
like the original.
*/
-- drop table for new database
DROP TABLE NWnew.ORDER_DETAILS PURGE;
DROP TABLE NWnew.ORDERS PURGE;
DROP TABLE NWnew.PRODUCTS PURGE;
DROP TABLE NWnew.SUPPLIERS PURGE;
DROP TABLE NWnew.CATEGORIES PURGE;
DROP TABLE NWnew.CUSTOMERS PURGE;
DROP TABLE NWnew.EMPLOYEETERRITORIES PURGE;
DROP TABLE NWnew.TERRITORIES PURGE;
DROP TABLE NWnew.REGION PURGE;
DROP TABLE NWnew.EMPLOYEES PURGE;
DROP TABLE NWnew.SHIPPERS PURGE;

-- creating table for new database 11 tables
CREATE TABLE NWnew.Employees 
(
    EmployeeID NUMBER(3) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(10) NOT NULL,
    Title VARCHAR(30) NULL,
    TitleOfCourtesy VARCHAR(25) NULL,
    BirthDate date NULL,
    HireDate date NULL,
    Address VARCHAR(60) NULL,
    City VARCHAR(15) NULL,
    Region VARCHAR(15) NULL,
    PostalCode VARCHAR(10) NULL,
    Country VARCHAR(15) NULL,
    HomePhone VARCHAR(24) NULL,
    Extension VARCHAR(4) NULL,
    Notes VARCHAR(500) NULL,
    ReportsTo NUMBER NULL
  );
  
CREATE TABLE NWnew.Categories 
(
  CategoryID NUMBER(2) NOT NULL,
  CategoryName VARCHAR(15) NOT NULL,
  Description VARCHAR(255) NULL

);
  
CREATE TABLE NWnew.Customers 
(
  CustomerID VARCHAR(5) NOT NULL,
  CompanyName VARCHAR(40) NOT NULL,
  ContactName VARCHAR(30) NULL,
  ContactTitle VARCHAR(30) NULL,
  Address VARCHAR(60) NULL,
  City VARCHAR(15) NULL,
  Region VARCHAR(15) NULL,
  PostalCode VARCHAR(10) NULL,
  Country VARCHAR(15) NULL,
  Phone VARCHAR(24) NULL,
  Fax VARCHAR(24) NULL
);
  
CREATE TABLE NWnew.Shippers 
(
  ShipperID NUMBER NOT NULL,
  CompanyName VARCHAR(40) NOT NULL,
  Phone VARCHAR(24) NULL
);
  
CREATE TABLE NWnew.Suppliers 
(
  SupplierID NUMBER NOT NULL,
  CompanyName VARCHAR(40) NOT NULL,
  ContactName VARCHAR(30) NULL,
  ContactTitle VARCHAR(30) NULL,
  Address VARCHAR(60) NULL,
  City VARCHAR(15) NULL,
  Region VARCHAR(15) NULL,
  PostalCode VARCHAR(10) NULL,
  Country VARCHAR(15) NULL,
  Phone VARCHAR(24) NULL,
  Fax VARCHAR(24) NULL,
  HomePage VARCHAR(2000) NULL
);
  
CREATE TABLE NWnew.Orders 
(
  OrderID NUMBER NOT NULL,
  CustomerID VARCHAR(5) NULL,
  EmployeeID NUMBER NULL,
  OrderDate VARCHAR(15) NULL,
  RequiredDate VARCHAR(15) NULL,
  ShippedDate VARCHAR(15) NULL,
  ShipVia NUMBER NULL,
  Freight NUMBER NULL,
  ShipName VARCHAR(40) NULL,
  ShipAddress VARCHAR(60) NULL,
  ShipCity VARCHAR(15) NULL,
  ShipRegion VARCHAR(15) NULL,
  ShipPostalCode VARCHAR(10) NULL,
  ShipCountry VARCHAR(15) NULL
);
  
CREATE TABLE NWnew.Products 
(
  ProductID NUMBER NOT NULL,
  ProductName VARCHAR(40) NOT NULL,
  SupplierID NUMBER NULL,
  CategoryID NUMBER NULL,
  QuantityPerUnit VARCHAR(20) NULL,
  UnitPrice NUMBER NULL,
  UnitsInStock NUMBER NULL,
  UnitsOnOrder NUMBER NULL,
  ReorderLevel NUMBER NULL,
  Discontinued NUMBER NOT NULL
);
  
CREATE TABLE NWnew.Order_Details
(
  OrderID NUMBER NOT NULL,
  ProductID NUMBER NOT NULL,
  UnitPrice NUMBER NOT NULL,
  Quantity NUMBER NOT NULL,
  Discount NUMBER NOT NULL
);
    
CREATE TABLE NWnew.Region 
( 
  RegionID NUMBER NOT NULL,
  RegionDescription VARCHAR(50) NOT NULL 
);
  
CREATE TABLE NWnew.Territories 
(
  TerritoryID VARCHAR(20) NOT NULL,
  TerritoryDescription VARCHAR(50) NOT NULL,
  RegionID NUMBER NOT NULL
);
  
CREATE TABLE NWnew.EmployeeTerritories 
(
  EmployeeID NUMBER NOT NULL,
  TerritoryID VARCHAR(20) NOT NULL 
);

-- installing PK and FK to match all 11 tables from original
ALTER TABLE NWnew.Employees
ADD (
      CONSTRAINT PK_Employees PRIMARY KEY (EmployeeID),
      CONSTRAINT FK_Employees_Employees FOREIGN KEY (ReportsTo) 
      REFERENCES Employees (EmployeeID)
    );
  
ALTER TABLE NWnew.Categories
ADD (
      CONSTRAINT PK_Categories PRIMARY KEY (CategoryID)
    );
  
ALTER TABLE NWnew.Customers
ADD (
      CONSTRAINT PK_Customers PRIMARY KEY (CustomerID)
    );
  
ALTER TABLE NWnew.Shippers
ADD (
      CONSTRAINT PK_Shippers PRIMARY KEY (ShipperID)
    );
  
ALTER TABLE NWnew.Suppliers
ADD (
      CONSTRAINT PK_Suppliers PRIMARY KEY (SupplierID)
    );
  
ALTER TABLE NWnew.Orders
ADD (
      CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
      CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) 
        REFERENCES Customers (CustomerID),
      CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID),
      CONSTRAINT FK_Orders_Shippers FOREIGN KEY (ShipVia) 
        REFERENCES Shippers (ShipperID)
    );
  
ALTER TABLE NWnew.Products
ADD (
      CONSTRAINT PK_Products PRIMARY KEY (ProductID),
      CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
        REFERENCES Categories (CategoryID),
      CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID)
        REFERENCES Suppliers (SupplierID),
      CONSTRAINT CK_Products_UnitPrice CHECK (UnitPrice >= 0),
      CONSTRAINT CK_ReorderLevel CHECK (ReorderLevel >= 0),
      CONSTRAINT CK_UnitsInStock CHECK (UnitsInStock >= 0),
      CONSTRAINT CK_UnitsOnOrder CHECK (UnitsOnOrder >= 0),
      CONSTRAINT CK_Discontinued CHECK (Discontinued IN (0,1))
    );
  
ALTER TABLE NWnew.Order_Details
ADD (
      CONSTRAINT PK_Order_Details PRIMARY KEY (OrderID,	ProductID),
      CONSTRAINT FK_Order_Details_Orders FOREIGN KEY (OrderID)
        REFERENCES Orders (OrderID),
      CONSTRAINT FK_Order_Details_Products FOREIGN KEY (ProductID)
        REFERENCES Products (ProductID),
      CONSTRAINT CK_Discount CHECK (Discount >= 0 and (Discount <= 1)),
      CONSTRAINT CK_Quantity CHECK (Quantity > 0),
      CONSTRAINT CK_UnitPrice CHECK (UnitPrice >= 0)
    );
  
ALTER TABLE NWnew.Region
ADD CONSTRAINT PK_Region PRIMARY KEY (RegionID);
  
ALTER TABLE NWnew.Territories
ADD (
      CONSTRAINT PK_Territories PRIMARY KEY (TerritoryID),
      CONSTRAINT FK_Territories_Region FOREIGN KEY (RegionID)
        REFERENCES Region (RegionID)
    );
  
ALTER TABLE NWnew.EmployeeTerritories
ADD (
      CONSTRAINT PK_EmployeeTerritories PRIMARY KEY(EmployeeID,TerritoryID),
      CONSTRAINT FK_EmplTerritories_Employees FOREIGN KEY (EmployeeID)
        REFERENCES Employees (EmployeeID),
      CONSTRAINT FK_EmplTerritories_Territories FOREIGN KEY (TerritoryID)
        REFERENCES Territories (TerritoryID)
    );