 --1.Use SELECT * and specific columns
 SELECT * FROM Customer
 SELECT FIRSTNAME, LASTNAME EMAILID FROM Customer

 SELECT * FROM City
 
 SELECT COUNTRYNAME FROM Country

 SELECT * FROM Province

SELECT * FROM ZipCode

SELECT CITYID, COUNTRYID FROM ZipCode

--2.Apply WHERE, AND, OR, LIKE, BETWEEN

 SELECT * FROM ZipCode WHERE CityID ='9'

   SELECT * FROM Customer WHERE FIRSTNAME= 'ANKIT'

  UPDATE Customer SET LastName = 'BARTHWAL' WHERE Password=  'yEN[J(78'

  SELECT *
FROM Customer
WHERE FIRSTNAME = 'Abdul'
  AND   LastName= 'Saboor'
   SELECT * FROM City WHERE CITYID =17 AND ProvinceNAME LIKE'G%'


  UPDATE City SET CityName ='DELHI' WHERE CityID = 17 AND ProvinceNAME = 'GOA'

  SELECT * FROM City WHERE CityName = 'DELHI' OR CityName ='GOA'
    
	SELECT FIRSTNAME, LastName
FROM Customer
WHERE CustomerID BETWEEN 2 AND 7
  
--3.Sort with ORDER BY

SELECT  firstname, lastname, DOB
FROM Customer
ORDER BY DOB;




 -- HANDLING NULL AND DEFAULT

 ALTER TABLE CITY
ADD  PROVINCENAME VARCHAR(20)

ALTER TABLE City
ADD CONSTRAINT DF_City_CityName
DEFAULT 'Unknown' FOR CityName;


INSERT INTO CITY (PROVINCENAME)
VALUES
  ('Sindh'),
  ('Punjab'),
  ('Khyber‑Pakhtunkhwa'),
  ('GOA'),
  ('Balochistan');

  ALTER TABLE City
ALTER COLUMN CityName VARCHAR(20) NULL;


















