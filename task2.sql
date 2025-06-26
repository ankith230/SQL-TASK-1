-- INSERT DATA IN TABLES 



Insert Into Customer Values

('Aamir','Abbasi','1998-03-29','Aamir@Whatmobile.Com.Pk','92Eac13CiJz','03008564501'),
('Aamir','Raees','1994-07-23','aamir.rais150@gmail.com','yEN[J(78','03007365250'),
('Abbas','Raza','1991-06-07','Abbas_raza94@Hotmail.Com','hLL77dq1_*','03235536781'),
('Abdul','Majid','1996-05-03','Kamranwahid2032@Ymail.Com','(2R_N,yzx+g|','03212800124'),
('Abdul','Saboor','1998-05-06','ubaidaslam1988@gmail.com','|0.6rgsO&c','03366840140'),
('Abdul','Moiz','1990-12-03','Abdulmoizmohsin@Gmail.Com','.VsH43r*E)','03005901176'),
('Dua','Abbas','1995-08-18','DuaAbbas@gmail.com','JZR-Fe1PG','03346953222'),
('Duncan','Majeed','1990-05-18','DuncanMajeed@gmail.com','Sd1G2qHmk','03452633929')

 

 Insert Into City Values('Karachi')
Insert Into City Values('Lahore')
Insert Into City Values('Faisalabad')
Insert Into City Values('Rawalpindi')
Insert Into City Values('Gujranwala')
Insert Into City Values('Peshawar')
Insert Into City Values('Multan')
Insert Into City Values('Hyderabad')
Insert Into City Values('Islamabad')
Insert Into City Values('Quetta')
Insert Into City Values('Bahawalpur')

 Insert Into Province Values('Sindh')
Insert Into Province Values('Punjab')
Insert Into Province Values('Khyber-Pakhtunkhwa')
Insert Into Province Values('Islamabad Capital Territory')
Insert Into Province Values('Balochistan')
 

  ALTER TABLE ZipCode ADD PostalCode VARCHAR(20) NOT NULL;


	


INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (1,  1,  8);
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (2,  1,  1);
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (3,  2,  7);
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (4,  2,  9);
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (5,  3,  4);
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (6,  3, 11 );
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (7,  4,  0);
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (8,  4,  3);
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (9,  5,  5);
INSERT INTO ZipCode (CityID, ProvinceID, CountryID) VALUES (10, 5,  2);
SELECT CountryID FROM Country;
 




INSERT INTO Country
VALUES
  ('Afghanistan'),
  ('Albania'),
  ('Algeria'),
  ('Andorra'),
  ('Angola'),
  ('Argentina'),
  ('Armenia'),
  ('Australia'),
  ('Austria'),
  ('Azerbaijan'),
  ('Bahamas'),
  ('Bahrain'),
  ('Bangladesh'),
  ('Barbados'),
  ('Belarus'),
  ('Belgium'),
  ('Belize'),
  ('Benin'),
  ('Bhutan'),
  ('Bolivia')
  
-- USE UPDATE AND DELETE COMMAND 


  update Customer  set FirstName ='ankit' where Contact= 03007365250

   select * from Customer

   delete from Customer where LastName ='raza'

    update Country set CountryName ='indai' where CountryID =1

	 select * from Country
	  	 select * from City

	 UPDATE Province SET ProvinceName ='GOA' WHERE ProvinceID =4
	 SELECT * FROM Province
	    