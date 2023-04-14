create database lesson_5;
use lesson_5;

create table tblCountryName(
	CountryID int Primary key auto_increment not null,
    CountryName Varchar(30) not null,
    ExportCoffebags int,
    ExportTeaPounds varchar(30)
);

create table tblOrder(
	OrderNo int primary key auto_increment not null,
    OrderDate Date not null,
    CustNo varchar(10) not null,
    Wholesale int not null,
    SalesRepNo varchar(10) not null
);

create table tblInventory(
	InventoryID int primary key auto_increment not null,
    ItemID varchar(5) not null,
    Caffeinated ENUM('Yes','No') not null,
    Price varchar(5) not null,
    OnHand int not null
);

create table tblOrderLine(
	OrderID int not null,
    InventoryID varchar(5) not null,
    Quantity int not null,
    UnitPrice varchar(7) not null,
    Discount varchar(7) not null
);

create table tblEmployeeTitle(
	TitleID INT PRIMARY KEY auto_increment NOT NULL,
    Title TEXT not null
);

CREATE TABLE tblSalesTaxRate(
	StateAbbreviation varchar(10) primary key not null,
    StateName text not null,
    TaxRate varchar(7) not null,
    Population int not null,
    LandArea int not null
);

create table tblCustomer(
	CustomerID int primary key auto_increment not null,
    CompanyName text not null,
    Contact text not null,
    Address text not null,
    City text not null,
    State varchar(5) not null,
    Zipcode int not null,
    PhoneNumber varchar(15) not null,
    FaxNumber varchar(15) not null,
    CreditLimit varchar(15)
);

create table tblEmployee(
	EmployeeID int primary key auto_increment not null,
    FirstName varchar(10) not null,
    LastName varchar(15) not null,
    Phone varchar(15) not null,
    TitleID varchar(5) not null,
    CommissionRate varchar(10) not null,
    HireDate Date not null,
    BirtDate date not null,
    Gender ENUM('F','M') not null,
    Notes text not null
);

create table tblINventoryDescription(
	ItemID int primary key auto_increment not null,
    Name text not null,
    BeverageType ENUM('t','c') not null,
    Flavored ENUM('Yes','No') not null,
    CountryID int not null,
    Comments text not null
);

select * from tblCountryName;

insert into tblCountryName(CountryID,CountryName,ExportCoffeBags,ExportTeaPounds)
values (0, 'n/a or unknown', NULL, NULL),
       (1, 'Afghanistan', NULL, NULL),
       (2, 'Albania', NULL, NULL),
       (3, 'Algeria', NULL, NULL),
       (4, 'American Samoa', NULL, NULL),
       (5, 'Andorra', NULL, NULL),
       (6, 'Angola', 3500000, NULL),
       (7, 'Anguilla', NULL, NULL),
       (8, 'Antarctica', NULL, NULL),
       (9, 'Antigua and Barbuda', NULL, NULL),
       (10, 'Argentina', NULL, NULL);
       
select * from tblOrder;

insert into tblOrder(OrderNo,OrderDate,CustNo,Wholesale,SalesRepNo)
values(14606,'2000-12-10','30473',1,'1695'),
	  (14607,'2000-12-16','30581',1,'1528'),
      (14608,'2000-12-17','35249',1,'1528'),
      (14609,'2000-12-18','33974',2,'3700'),
      (14610,'2000-12-19','35201',1,'4112'),
      (14611,'2000-12-21','32350',2,'4029'),
      (14612,'2000-12-21','34666',2,'4058'),
      (14613,'2000-12-22','34458',2,'4012'),
      (14614,'2000-12-22','31932',2,'3692'),
      (14615,'2000-12-16','30744',2,'3700');
      
  alter table tblInventory
  MODIFY COLUMN Price varchar(10);
      
insert into tblInventory(InventoryID,ItemID,Caffeinated,Price,OnHand)
values(1101,'116','Yes','$8.10',512),
	  (1102,'422','No','$5.30',3190),
      (1103,'440','No','$7.70',-130),
      (1104,'455','No','$5.30',3380),
      (1105,'449','No','$7.60',3300),
      (1106,'224','Yes','$7.40',1130),
      (1107,'113','Yes','$8.80',315),
      (1108,'134','Yes','$10.30',443),
      (1109,'275','Yes','$8.00',354),
      (1110,'353','No','$13.70',354);
      
alter table tblOrderLine
modify column InventoryID int,
modify UnitPrice varchar(10),
modify Discount varchar(10);

insert into tblOrderLine(OrderID,InventoryID,Quantity,UnitPrice,Discount)
values(14606,1123,7,'$8.00','0.00%'),
	  (14607,1101,16,'$8.10','5.00%'),
      (14608,1188,8,'$3.80','0.00%'),
      (14608,1207,19,'$8.40','5.00%'),
      (14608,1221,6,'$5.60','0.00%'),
      (14609,1128,18,'$8.90','5.00%'),
      (14609,1114,3,'$5.30','0.00%'),
      (14609,1215,15,'$4.70','15.00%'),
      (14609,1221,2,'$5.60','0.00%'),
      (14610,1133,17,'$7.90','5.00%'),
      (14610,1159,14,'$6.40','15.00%'),
      (14610,1190,15,'$7.20','15.00%'),
      (14610,1241,3,'$5.30','0.00%'),
      (14610,1244,18,'$7.40','5.00%'),
      (14611,1110,18,'$13.70','10.00%'),
      (14611,1168,2,'$325.00','0.00%');
      
  insert into tblEmployeeTitle(TitleID,Title)
  values(1,'Sales Trainee'),
		(2,'Sales Associate'),
        (3,'Senior Sales Associate'),
        (4,'Sales Manager'),
        (5,'Senior Sales Manager'),
        (6,'Division Sales Manager'),
        (7,'Regional Manager'),
        (8,'Division Manager'),
        (9,'National Sales Manager');
        
insert into tblSalesTaxRate(StateAbbreviation,StateName,TaxRate,Population,LandArea)
values('AK','Alaska','0.00%',524000,589757),
	  ('AL','Alabama','4.00%',4102000,51609),
      ('AR','Arkansas','4.50%',2395000,53104),
      ('AZ','Arizona','5.00%',3489000,113909),
      ('CA','California','7.25%',28314000 ,158693),
      ('CO','Colorado','3.00%',3301000 ,104247),
      ('CT','Connecticut','6.00%',3233000 ,5009),
      ('DE','Delaware','0.00%',660000 ,2057),
      ('FL','Florida','6.00%',12335000 ,58560),
      ('GA','Georgia','4.00%',6324105 ,58876),
      ('HI','Hawaii','4.00%',1098000 ,6450),
      ('IA','Iowa','5.00%',2834000 ,56290),
      ('ID','Idaho','5.00%',1003000 ,83557),
      ('IL','Illionois','6.25%',11614000 ,56400);
      
select * from tblCustomer;

insert into tblCustomer(CustomerID,CompanyName,Contact,Address,City,State,ZipCode,PhoneNumber,FaxNumber,CreditLimit)
values(30121,'Fairfield Communities Inc.','Best, F. Stanley','2800 Cantrell Road','Little Rock','AR',72202,'(501) 555-6079','(501) 555-6111',NULL),
	  (30125,'Alamo Group Inc.','Maul, Duane A.','1502 East Walnut','Seguin','TX',78155,'(210) 555-1483','(210) 555-1539','$15,600.00'),
      (30129,'Kiwi International Air Lines Inc.','Rigas, Alan J.','Demishphere Center','Newark','NJ',07114,'(201) 555-1311','(201) 555-1395',NULL),
      (30132,'Republic Bancorp Inc.','Murray, T. Peter','1070 East Main Street','Owosso','MI',48867,'(517) 555-7364','(517) 555-7430',NULL),
      (30136,'Browne Bottling Co.','Shelton, Carl E.','411 First Avenue South','Oklahoma City','OK',73102,'(405) 555-1168','(405) 555-1228',NULL),
      (30139,'Cavco Industries Inc.','Golkin, David','422 Wards Corner Road','Phoenix','AZ',85012,'(602) 555-6141','(602) 555-6232','$41,200.00'),
      (35494,'National Intergroup Inc.','Jones, Richard A.','1220 Senlac Drive','Carrollton','TX',75006,'(214) 555-4810','(214 555-4900)',NULL);

alter table tblEmployee
RENAME column BirtDate to BirthDate;

insert into tblEmployee(EmployeeID,FirstName,LastName,Phone,TitleID,CommissionRate,HireDate,BirthDate,Gender,Notes)
values(1301,'Patti','Stonesifer','555-5193',2,'5.00%','1996-7-6','1966-3-10','F','She has worked hard the whole career. She embodies a true type A personality. Part of the promotion ''97 team!'),
(1364,'Kevin','Pruski','555-5645',1,'4.00%','2000-12-1','1979-1-26','M','New to the organization but is showing promise. Kevin has made several new contacts.'),
(1528,'Luca','Pacioli','555-5876',2,'6.00%','1995-8-26','1950-5-6','M','Talkative and a bit slow at times. He shows great potential. However, he insists on using old fashioned methods, and I think he would be happier as an accountant!'),
(1695,'Ted','Nagasaki','555-5021',1,'4.00%','2000-1-28','1977-4-10','M','Ted can be molded into a fine salesperson if closely supervised.'),
(2240,'Sharon','Stonley','555-5602',3,'15.00%','1988-11-5','1961-5-3','F','Acting department head for a number of quarters, Sharon shows initiative and is a sure bet for making salesperson of the year!'),
(2318,'Helen','Hunter','555-5018',2,'8.00%','1993-11-16','1954-1-26','F','Witty and fun, Helen always makes her clients feel comfortable.');

insert into tblInventoryDescription(ItemID,Name,BeverageType,Flavored,CountryID,Comments)
values(134,'China Yunnan','t','No',41,'Black tea; tea from this province in southwestern China was first exported over 1,000 years ago. Originally a source of green tea, Yunnan in recent years has developed a black tea that is lighter and more delicately flavored than some of the traditional South China Congous.'),
(137,'Darjeeling Namring','t','No',82,'Black tea; Assam, known as Darjeeling. Darjeeling is grown in the foothills of the Himalayas at elevations of 1,000 to 6,000 feet. It has a complex aroma with a clear, brisk, and penetrating flavor. Darjeeling is truly one of the finest teas in the world!'),
(140,'Kalgar-India','t','No',82,'Black tea;'),
(146,'Mocha','c','No',151,'Bold, earthy, mild acidity. One of Arabia''s oldest and best known coffees.'),
(176,'New Zealand Sunnyslopes','t','No',127,'Fruit blend Tisanes;'),
(179,'Passion Fruit Blend','t','No',0,'Fruit blend Tisanes;'),
(182,'Columbia Bucaramanga Especial','c','No',42,'Full bodied, medium acidity, nutty undertones; a soft-bean coffee with some of the character of fine Sumatran coffees.'),
(185,'Columbia Supremo','c','No',42,'Full bodied; walnutty flavor. The top of the line for Colombian arabicas.'),
(212,'Pan Fired Green','t','No',0,'Green tea'),
(251,'Lemon Grass','t','No',41,'Herbal Tisanes; cut, sifted'),
(254,'Chamomile Blossom','t','No',56,'Herbal Tisanes; whole flowers. Sweet and complex. Grown on the plains of the Nile valley. The world''s best Chamomile'),
(257,'Hibiscus','t','No',116,'Herbal Tisanes; whole flowers'),
(260,'Espresso Roast','c','No',0,'Intense, hearty, satisfying'),
(263,'Mexican Coatepec','c','No',116,'It has a fine acidity, delicate body, and pleasantly mellow flavor. Fine Mexican coffees such as Coatepec now compare well with those from Central America.'),
(266,'Kona Extra Fancy','c','No',183,'Mild, smooth, and delicately aromatic. A mellow roast. This coffee is processed using the wet method to separate the cherry from the bean. Doing so produces a bright, lively acidity. Grown on the slopes of Mauna Loa on the Kona district of the island of H'),
(269,'Passionfruit with Flowers','t','Yes',93,'Natural flavored tea;');