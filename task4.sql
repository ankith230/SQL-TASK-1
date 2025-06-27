--1.Apply aggregate functions on numeric columns
SELECT SUM (  loyalty_points) as total_loyalty from Customer

 SELECT sum( population_estimate) as population  from City

 SELECT Min(population_estimate) FROM city;




 SELECT COUNT(*) FROM Customer;

SELECT AVG(population_estimate) FROM City;

SELECT AVG(loyalty_points) FROM Customer;


SELECT MAX(population_estimate) FROM city;



--2.Use GROUP BY to categorize
 
 SELECT CityName, 
       SUM(population_estimate) AS total_population
FROM City
GROUP BY CityName;

SELECT customerid, AVG(loyalty_points) AS avg_loyalty_points
FROM Customer
GROUP BY customerid
ORDER BY avg_loyalty_points DESC;


SELECT CityName, MAX(population_estimate) AS max_population
FROM City
GROUP BY CityName;





--3.Filter groups using HAVING

SELECT  AVG(loyalty_points) AS avg_loyalty_points
FROM Customer
GROUP BY loyalty_points
HAVING AVG(loyalty_points) > 130;

SELECT customerid, min(loyalty_points) AS avg_loyalty_points
FROM Customer
GROUP BY customerid
HAVING max(loyalty_points) > 100;