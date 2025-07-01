CREATE DATABASE ECOM


--1.Create two related tables (e.g., Customers, Orders)

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'Alice Johnson', 'USA'),
(2, 'Bob Smith', 'Canada'),
(3, 'Charlie Lee', 'UK'),
(4, 'Diana King', 'Australia'),
(5, 'Ethan Brown', 'Germany'),
(6, 'Fiona White', 'France'),
(7, 'George Clark', 'India'),
(8, 'Hannah Lewis', 'Brazil'),
(9, 'Ian Walker', 'Japan'),
(10, 'Julia Hall', 'Mexico');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount) VALUES
(1, '2025-06-01', 1, 250.00),
(2, '2025-06-02', 2, 175.50),
(3, '2025-06-03', 3, 320.99),
(4, '2025-06-04', 1, 89.75),
(5, '2025-06-05', 4, 500.00),
(6, '2025-06-06', 5, 215.40),
(7, '2025-06-07', 2, 150.25),
(8, '2025-06-08', 6, 425.00),
(9, '2025-06-09', 7, 199.99),
(10, '2025-06-10', 3, 340.10);



--2.Use INNER, LEFT, RIGHT, FULL JOIN, CROSSJOIN
-- LEFT JOIN

SELECT Customers.CustomerName, Orders.OrderID, Orders. OrderDate
FROM Orders
 LEFT JOIN Customers
  ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerName, Orders.OrderDate, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
-- RIGHT JOIN
SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers 
RIGHT JOIN Orders 
  ON Customers.CustomerID = Orders.CustomerID;

   SELECT Customers.CustomerName, Orders.OrderID, Orders. OrderDate
FROM Orders
 RIGHT JOIN Customers
  ON Customers.CustomerID = Orders.CustomerID;
-- FULL JOIN
  SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers 
FULL OUTER JOIN Orders 
  ON Customers.CustomerID = Orders.CustomerID;

  SELECT Customers.CustomerName, Orders.OrderID, Orders. OrderDate
FROM Orders
 FULL  JOIN Customers
  ON Customers.CustomerID = Orders.CustomerID;

  -- INNER JOIN



  SELECT Customers.CustomerName, Orders.OrderID, Orders. OrderDate
FROM Orders
 INNER JOIN Customers
  ON Customers.CustomerID = Orders.CustomerID;

  SELECT Customers.CustomerName, Orders.OrderDate, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;









  

  


