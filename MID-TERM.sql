create database Bussines_Rule;
use Bussines_Rule;-- 

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

-- 1. Find all information about john smith 
SELECT e.Fname, e.Lname, e.Ssn, e.Bdate, e.Address, e.Salary, d.Dname, p.Pname, p.Plocation
FROM EMPLOYEE as e
JOIN DEPARTMENT as d ON e.Dno = d.Dnumber
JOIN PROJECT as p ON e.Dno = p.Dnumber
WHERE e.Fname = 'John' AND e.Lname = 'Smith';

-- 2. What department started on April 5, 1988
select Dname,Mgr_start_date from DEPARTMENT as d
where Mgr_start_date like '%05%';

-- 3. Where does James Borg lives
select Fname,Lname,Address from EMPLOYEE
where Fname = 'James' and LName = 'Borg';

UPDATE EMPLOYEE
SET Lname = 'Borg'
WHERE Fname = 'James' AND Lname = 'Borh';

update employee
set Ssn = 987654321
where Fname = "Jennifer" and Lname = "Wallace";

-- 4. Who are the sposes of the employees
select e.Fname, e.Lname , d.Dependent_name, d.Relationship 
from employee as e
join dependent as d ON e.ssn = d.eSsn 
where d.Relationship = 'Spouse' ;

-- 5. What is the project located at SugarLand
select * from project
where Plocation = 'Sugarland';

-- 6. Who is the manager of Research department?
select d.Dname , d.Mgr_ssn , e.Fname , e.Lname from employee as e
join department as d on e.Ssn = d.Mgr_ssn
where Dname = 'Research';

-- 7. who are the employees that work on project Newbenefits?
select e.Fname , e.Lname , p.Pname from employee as e
join PROJECT as p on e.Dno = p.Dnumber
where Pname = 'Newbenefits';

-- 8. Who are dependents of Franklin Wong?
select e.Fname , e.Lname , d.Dependent_name , d.Relationship from employee as e
join dependent as d on d.Essn = e.Ssn
where Fname = 'Franklin' and Lname = 'Wong';

-- 9. who are the dependents of employees who were assigned to project 
--    Computerization

select d.Dependent_name, d.Relationship , p.Pname , dt.Dname from dependent as d
join department as dt on dt.Mgr_ssn = d.Essn
join project as p on p.Dnumber = dt.Dnumber
where p.Pname = 'Computerization';

-- 10. in what department do employees belong, whose dependent are their sons?
select dt.Dname from dependent as d
join department as dt on d.Essn = dt.Mgr_ssn
where d.Relationship = 'Son';






