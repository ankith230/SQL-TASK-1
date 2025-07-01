-- 1.Use scalar and correlated subqueries

---SCALAR subqueries

SELECT CustomerID,
       CustomerName,
       (SELECT MAX(Amount) FROM Orders) AS MaxOrderInSystem
FROM Customers;
-- THIS returns one value for the entire query

---CORRELATED  subqueries

SELECT C.CustomerID,
       C.CustomerName,
       (SELECT MAX(O.Amount)
        FROM Orders O
        WHERE O.CustomerID = C.CustomerID) AS MaxOrderByCustomer
FROM Customers C;

--The inner query runs per row in Customers

-- 2.Use subqueries inside IN, EXISTS, =
-- WHERE WITH EXISTS IN Correlated subquery

SELECT CustomerName
FROM Customers C
WHERE EXISTS (
    SELECT 1
    FROM Orders O
    WHERE O.CustomerID = C.CustomerID
      AND O.Amount > 200
);
--USING IN  subquery

SELECT CustomerName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
);

-- Combining IN and aggregation
SELECT CustomerName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE Amount > (
        SELECT AVG(Amount) FROM Orders
    )
);

--Using = with a scalar subquery

SELECT O.CustomerID, O.OrderDate, O.Amount
FROM Orders O
WHERE O.Amount = (
  SELECT MAX(Amount)
  FROM Orders
  WHERE CustomerID = O.CustomerID
);
.

