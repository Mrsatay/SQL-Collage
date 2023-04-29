create database Bussines_Rule;
use Bussines_Rule;

create table EMPLOYEE(
	Fname text not null,
    Lname text not null,
    Ssn int primary key not null,
    Bdate date not null,
    Address text not null,
    Salary int not null,
    Dno int not null
);

INSERT INTO EMPLOYEE (Fname, Lname, Ssn, Bdate, Address, Salary, Dno)
VALUES
  ("John", "Smith", 123456789, "1965-01-09", "Fondren, Houston, TX", 30000, 5),
  ("Franklin", "Wong", 333445555, "1965-12-08", "Vass, Houston, TX", 40000, 5),
  ("Alicia", "Zelaya", 999887777, "1968-01-19", "Castle. Spring, TX", 25000, 4),
  ("Jennifer", "Wallace", 986754321, "1941-06-20", "Berry, Bellaire, TX", 43000, 4),
  ("Ramesh", "Narayan", 666884444, "1962-09-15", "Fire Oak, Humble, TX", 38000, 5),
  ("James", "Borh", 888665555, "1937-11-10", "Stone, Houston, TX", 55000, 1);

create table PROJECT(
	Pname text not null,
    Plocation text not null,
    Pnumber int not null,
    Dnumber int not null
);

INSERT INTO PROJECT (Pname,Plocation,Pnumber,Dnumber)
VALUES ("Computerization","Stafford",1,5),
	   ("Rerganization","Houston",10,1),
       ("Newbenefits","Sugarland",20,4);

create table DEPENDENT(
	Essn int not null,
    Dependent_name text not null,
    Relationship text not null
);

INSERT INTO DEPENDENT(Essn,Dependent_name,Relationship)
VALUES(333445555,"Alice","Daughter"),
	  (333445555,"Joy","Spouse"),
      (333445555,"Theodore","Son"),
      (987654321,"Abner","Spouse"),
      (123456789,"Michael","Son"),
      (123456789,"Alice","Daughter"),
      (123456789,"Elizabeth","Spouse");

create table DEPARTMENT(
	Dname text not null,
    Dnumber int not null,
    Mgr_ssn int not null,
    Mgr_start_date date not null
);

INSERT INTO DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)
VALUES("Research",5,333445555,"1988-04-05"),
	  ("Administration",5,987654321,"1995-01-01"),
      ("Headquarters",5,888665555,"1981-06-19");




