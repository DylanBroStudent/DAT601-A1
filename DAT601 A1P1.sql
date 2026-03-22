-- DAT601 Assessment 1 Part 1
-- Dylan Brodie

-- Create Database
USE MASTER;
GO
DROP DATABASE IF EXISTS [DAT601-A1-P1];
GO
CREATE DATABASE [DAT601-A1-P1];
GO
USE [DAT601-A1-P1];

-- Create Tables
DROP PROCEDURE IF EXISTS create_tables;
GO
CREATE PROCEDURE create_tables
AS
BEGIN

	DROP TABLE IF EXISTS OrderItem;
	CREATE TABLE OrderItem
	(
		OrderID		INTEGER		NOT NULL,
		OrderItem	INTEGER		NOT NULL,
		ProductID	CHAR(10)	NOT NULL, --foreign
		Quantity	INTEGER		NOT NULL,
		ItemPrice	DECIMAL(8,2)NOT NULL
	);

	DROP TABLE IF EXISTS Product;
	CREATE TABLE Product
	(
		ProductID		CHAR(10)	NOT NULL,
		VendorID		CHAR(10)	NOT NULL, --foreign
		ProductName		CHAR(255)	NOT NULL,
		ProductPrice	DECIMAL(8,2)NOT NULL,
		ProductDesc		VARCHAR(100)		
	);

	DROP TABLE IF EXISTS OrderEntry;
	CREATE TABLE OrderEntry
	(
		OrderID		INTEGER		NOT NULL, --foreign
		OrderDate	DATETIME	NOT NULL,
		CustID		CHAR(10)	NOT NULL --foreign
	);

	DROP TABLE IF EXISTS Customer;
	CREATE TABLE Customer
	(
		CustID		CHAR(10)	NOT NULL,
		CustName	CHAR(50)	NOT NULL,
		CustAddress	CHAR(50)	,
		CustCity	CHAR(50)	,
		CustContact	CHAR(50)	,
		CustPhone	CHAR(15)	,
		CustEmail	CHAR(255)	
	);

	DROP TABLE IF EXISTS Vendor;
	CREATE TABLE Vendor
	(
		VendorID		CHAR(10)	NOT NULL,
		VendorName		CHAR(50)	NOT NULL,
		VendorAddress	CHAR(50)	,
		VendorCity		CHAR(50)	,
		VendorPhone		CHAR(15)
	);
END;
GO
EXEC create_tables;
GO

-- Populate Tables
DROP PROCEDURE IF EXISTS populate_tables;
GO
CREATE PROCEDURE populate_tables
AS
BEGIN
	INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact,CustEmail)
	VALUES('1000000001','Village Toys','200 Oak Lane','Wellington','09-389-2356','John Smith','sales@villagetoys.co.nz');

	INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact)
	VALUES('1000000002','Kids Place','333 Tahunanui Drive','Nelson','03-545-6333','Michelle Green');

	INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact,CustEmail)
	VALUES('1000000003','Fun4All','1 Sunny Place','Nelson','03-548-2285','Jim Jones','jjones@fun4all.co.nz');

	INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact,CustEmail)
	VALUES('1000000004','Fun4All','829 Queen Street','Auckland','09-368-7894','Denise L. Stephens','dstephens@fun4all.co.nz');

	INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact)
	VALUES('1000000005','The Toy Store','50 Papanui Road','Christchurch','04-345-4545','Kim Howard');


	INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
	VALUES(20005,'1999/5/1','1000000001');

	INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
	VALUES(20006,'1999/1/12','1000000003');

	INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
	VALUES(20007,'1999/1/30','1000000004');

	INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
	VALUES(20008,'1999/2/3','1000000005');

	INSERT INTO OrderEntry(OrderID,OrderDate,CustID)
	VALUES(20009, '1999/2/8','1000000001');


	INSERT INTO Vendor(VendorID, VendorName, VendorAddress, VendorCity, VendorPhone)
	VALUES('BRS01','Bears R Us','123 Main Street','Richmond','03-523-8871');

	INSERT INTO Vendor(VendorID, VendorName, VendorAddress, VendorCity, VendorPhone)
	VALUES('BRE02','Bear Emporium','500 Park Street','Auckland','06-396-8854');

	INSERT INTO Vendor(VendorID, VendorName, VendorAddress, VendorCity, VendorPhone)
	VALUES('DLL01','Doll House Inc.','555 High Street','Motueka','03-455-7898');

	INSERT INTO Vendor(VendorID, VendorName, VendorAddress, VendorCity, VendorPhone)
	VALUES('FRB01','Furball Inc.','1 Clifford Avenue','Nelson','03-546-9978');


	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20005,1,'BR01',100,5.49);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20005,2,'BR03',100,10.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20006,1,'BR01',20,5.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20006,2,'BR02',10,8.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20006,3,'BR03',10,11.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20007,1,'BR03',50,11.49);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20007,2,'BNBG01',100,2.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20007,3,'BNBG02',100,2.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20007,4,'BNBG03',100,2.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20007,5,'RGAN01',50,4.49);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20008,1,'RGAN01',5,4.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20008,2,'BR03',5,11.99);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20008,3,'BNBG01',10,3.49);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20008,4,'BNBG02',10,3.49);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20008,5,'BNBG03',10,3.49);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20009,1,'BNBG01',250,2.49);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20009,2,'BNBG02',250,2.49);

	INSERT INTO OrderItem(OrderID,OrderItem,ProductID,Quantity,ItemPrice)
	VALUES(20009,3,'BNBG03',250,2.49);


	INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
	VALUES('BR01', 'BRS01', '8 inch teddy bear',5.99,'8 inch teddy bear, comes with cap and jacket');

	INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
	VALUES('BR02', 'BRS01', '12 inch teddy bear',8.99,'12 inch teddy bear, comes with cap and jacket');

	INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
	VALUES('BR03', 'BRS01', '18 inch teddy bear',11.99,'18 inch teddy bear, comes with cap and jacket');

	INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
	VALUES('BNBG01', 'DLL01', 'Fish bean bag toy',3.49,'Fish bean bag toy, complete with bean bag worms with which to feed it');

	INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
	VALUES('BNBG02', 'DLL01', 'Bird bean bag toy',3.49,'Bird bean bag toy, eggs are not included');

	INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
	VALUES('BNBG03', 'DLL01', 'Rabbit bean bag toy',3.49,'Rabbit bean bag toy, comes with bean bag carrots');

	INSERT INTO Product(ProductID, VendorID, ProductName, ProductPrice, ProductDesc)
	VALUES('RGAN01', 'DLL01', 'Raggedy Ann',4.99,'18 inch Raggedy Ann doll');
END
GO
EXEC populate_tables;
GO

-- Constraints
ALTER TABLE Customer
ADD CONSTRAINT PK_Customer PRIMARY KEY (CustID);

ALTER TABLE Vendor
ADD CONSTRAINT PK_Vendor PRIMARY KEY (VendorID);

ALTER TABLE Product
ADD 
	CONSTRAINT PK_Product PRIMARY KEY (ProductID),
	CONSTRAINT FK_Product_Vendor FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID);

ALTER TABLE OrderEntry
ADD 
	CONSTRAINT PK_OrderEntry PRIMARY KEY (OrderID),
	CONSTRAINT FK_OrderEntry_Customer FOREIGN KEY (CustID) REFERENCES Customer(CustID);

ALTER TABLE OrderItem
ADD 
	CONSTRAINT PK_OrderItem PRIMARY KEY (OrderID, OrderItem),
	CONSTRAINT FK_OrderItem_OrderEntry FOREIGN KEY (OrderID) REFERENCES OrderEntry(OrderID),
	CONSTRAINT FK_OrderItem_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

GO
-- Queries

-- 1. List all products not made by vendor DLL01 (WHERE, <>).

SELECT ProductID, ProductName 
FROM Product 
WHERE VendorID <> 'DLL01';

-- 2. List all the products with a price between $5.00 and $10.00 (WHERE, BETWEEN)
SELECT ProductName, ProductPrice
FROM Product
WHERE ProductPrice BETWEEN 5 AND 10;

-- 3. List any products made by either vendor DLL01 or vendor BRS01 costing $10.00 or greater (WHERE, OR, AND, also look at order of evaluation using parenthesis).
SELECT ProductName, ProductPrice
FROM Product
WHERE (VendorID = 'DLL01' OR VendorID = 'BRS01') AND ProductPrice >= 10.00;

-- 4. Return the average price of all the products in the Products table (AVG).
SELECT AVG(ProductPrice) AS 'Average Product Price'
FROM Product;

-- 5. Return the total number of customers in the Customers table (COUNT (*), AS result name).
SELECT COUNT(*) AS 'Total Customers'
FROM Customer;

-- 6. Return the number of customers in the Customers table with an e-mail address (COUNT (column name)).
SELECT COUNT(CustEmail) AS 'Total Emails Contacts'
FROM Customer;

-- 7. Return the number of product types, minimum, maximum and average product price, from the products table.
SELECT 
	COUNT(ProductID) AS 'Product Types', 
	MIN(ProductPrice) AS 'Minimum Price', 
	MAX(ProductPrice) AS 'Maximum Price', 
	AVG(ProductPrice) AS 'Average Price'
FROM Product;

-- 8. Joins: Return the vendor’s name, product price and product name from the vendors and products tables (JOIN or WHERE tablename.columnname, =).
SELECT V.VendorName, P.ProductName, P.ProductPrice
FROM Product P
INNER JOIN Vendor V ON P.VendorID = V.VendorID;

-- 9. Return the product name, vendor name, product price and quantity for each item in order number 20007 (JOIN or WHERE tablename.columnname, =, AND)
SELECT 
	P.ProductName, 
	V.VendorName, 
	P.ProductPrice,
	O.Quantity
FROM OrderItem O
INNER JOIN Product P ON O.ProductID = P.ProductID
INNER JOIN Vendor V ON P.VendorID = V.VendorID
WHERE O.OrderID = 20007 AND V.VendorName IS NOT NULL
ORDER BY P.ProductName;

-- 10. Create a list of all the customers (customer name and customer contact) who ordered item RGAN01
SELECT C.CustName, C.CustContact
FROM Customer C
WHERE C.CustID IN (
	SELECT C.CustID
	FROM Customer C
	INNER JOIN OrderEntry OE ON C.CustID = OE.CustID
	INNER JOIN OrderItem OI ON OE.OrderID = OI.OrderID
	INNER JOIN Product P ON OI.ProductID = P.ProductID
	WHERE P.ProductID = 'RGAN01'
	);


-- 11. Display the total number of orders placed by every customer in the Customers table, as well as the city the customer is in
-- - Retrieve the list of customers from the customers table
-- - For each customer retrieved, count the number of associated orders in the Orders table.
SELECT 
	C.CustName, 
	C.CustCity, 
	(	SELECT COUNT(O.OrderID)
		FROM OrderEntry O
		WHERE C.CustID = O.CustID
		) 'Total Orders'
FROM Customer C
ORDER BY C.CustName;

-- 12. Create a report on all the customers in Nelson and Wellington. You also should include
-- all Fun4All locations, regardless of city. The resulting customers should be in
-- alphabetical order of customer name then customer contact. (CTE, WHERE, IN(), UNION,
-- ORDER BY).
WITH CustReport AS (
	SELECT
		CustName,
		CustContact,
		CustEmail
	FROM
		Customer
	WHERE
		CustCity IN ('Nelson', 'Wellington')
	UNION
	SELECT
		CustName,
		CustContact,
		CustEmail
	FROM
		Customer
	WHERE
		CustName = 'Fun4All'
)
SELECT *
FROM 
	CustReport
ORDER BY
	Custname, CustContact;
GO

-- Views

-- 13. Create a view called vProductCustomer which joins the Customer, Order and OrderItem
-- tables to return a list of all customers who have ordered any product (CREATE VIEW, AS).

-- DDL
DROP VIEW IF EXISTS vProductCustomer;
GO

CREATE VIEW vProductCustomer AS						-- Name the view
SELECT C.CustName, C.CustContact, OI.ProductID		-- Select the columns for the view
FROM Customer C										-- Select the starting point for the joins
INNER JOIN OrderEntry OE ON C.CustID = OE.CustID	-- Join the data to get more details from other tables
INNER JOIN OrderItem OI ON OE.OrderID = OI.OrderID
GO													-- seperate the DDL from DML

-- Now retrieve from that view a list of customers who ordered product RGAN01.

-- DML
SELECT CustName, CustContact	-- Get the columns from the view
FROM vProductCustomer			-- Get the view itself
WHERE ProductID = 'RGAN01';		-- define the condition to filter output

GO

-- 14. Use an INSERT statement to add a customer to the database:
--	• CustID = 1000000006
--	• CustName = <Your name>
--	• CustPhone = <0x-xxx-xxx , Your Phone>

-- See below for the expected address and its format.
-- Include your Insert statement in your on-going SQL SCRIPT.

INSERT INTO Customer(CustID,CustName,CustAddress,CustCity,CustPhone,CustContact,CustEmail)
VALUES('1000000006','Brodie Corp',NULL, NULL,'01-234-5678','Dylan Brodie','dylan@brodiecorp.co.nz');

GO

-- Using a View to format mailing list data:
--	• First write and run a query that will display the customer’s name and then the
--	  address in the following format – pay attention to the third column it has a specific
--	  format: | CustName | Customer address | City/town,Phone number |
/*
SELECT 
	Custname 'Name', 
	CustAddress 'Address', 
	COALESCE(Rtrim(CustCity), 'NULL') + ', ' + COALESCE(CustPhone, 'NULL') 'Contact Details'	-- use Rtrim to trim the city data, and coalesce to handle nulls neatly
FROM 
	Customer;
*/

--	• Turn this query into a view called vCustomerMailingLabel
/*
CREATE VIEW vCustomerMailingLabel AS	-- Define the new view and drop in the previous query
SELECT 
	Custname 'Name', 
	CustAddress 'Address', 
	COALESCE(Rtrim(CustCity), 'NULL') + ', ' + COALESCE(CustPhone, 'NULL') 'Contact'
FROM 
	Customer;
GO					-- When you gotta GO, you gotta GO
*/

--	• Write query to display all the “entries” in vCustomerMailingLabel
/*
SELECT *						-- Select all
FROM vCustomerMailingLabel;		-- From the view
*/

-- The query is to display all entries presented in the View

--	• Finish by writing a View that provides customer mailing labels that filters out any
--	  incomplete addresses as these cannot be used for mailing labels.
DROP VIEW IF EXISTS vCustomerMailingLabel;
GO

CREATE VIEW vCustomerMailingLabel AS
SELECT 
	Custname AS 'Name', 
	CustAddress AS 'Address', 
	COALESCE(Rtrim(CustCity), 'NULL') + ', ' + COALESCE(CustPhone, 'NULL') AS 'Contact'
FROM 
	Customer
WHERE
	CustAddress IS NOT NULL AND CustPhone IS NOT NULL AND CustCity IS NOT NULL;
GO

SELECT *
FROM vCustomerMailingLabel;