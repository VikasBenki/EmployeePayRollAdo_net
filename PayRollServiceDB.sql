------------------UC1-CreateDatabase with name  Payroll service-------
Create DataBase Payroll_Service
use Payroll_Service
select db_name() as CurrentDatabase

-------------UC2-Creating the Table for the database-----
Create Table Employee_Payroll
(
id int identity primary key,
Name varchar(50),
salary float,
startdate date
);
select *from Employee_Payroll;

-------UC3-Create Employee PayRoll data as a part of the crud operation------
insert into Employee_Payroll (Name, salary, startdate) values
('Dhoni', 8000000.00, '2005-07-25'),
('Dawan', 5000000.00, '2008-03-22'),
('Smrithi', 3000000.00, '2018-05-15'),
('kaur', 2000000.00, '2016-02-03'),
('Sadvitha', 5000000.00, '2019-05-28');



---------UC4-Retrive Data from Employee payRoll--------
select *from Employee_Payroll;

------UC5-Retrive the employee salary of the particular employee----
select salary from Employee_Payroll where Name='Dhoni';
select *From Employee_Payroll where startdate between CAST('2008-01-1' as date) and getdate();


----------UC6 Add gender to Employee Payroll table and update the rows to retrive the correct gender---
Alter table Employee_Payroll add Gender char(1);
Update Employee_Payroll set Gender = 'M' where id in (1, 2);
Update Employee_payroll set Gender = 'F' where id in (3,4,5);



-------UC7-- find sum, average, min, max and number of male and female employees--------
select sum(Salary) as sumsalary,Gender from Employee_payroll group by Gender;
select avg(Salary) as avgsalary,Gender from Employee_payroll group by Gender; 
select max(Salary) as maxsalary,Gender from Employee_payroll group by Gender; 
select min(Salary) as minsalary,Gender from Employee_payroll group by Gender; 
select count(Name) as EmployeeCount,Gender from employee_payroll group by Gender;  

--------------UC8-- add employee phone, department(not null), Address (using default values)-------------------
select *from Employee_Payroll;
alter table employee_payroll add Phone bigint;
update Employee_Payroll set Phone = 1432526522; 
update Employee_Payroll set Phone = 1432420201 where ID IN (2,4); 
alter table Employee_Payroll add Address varchar(100) not null default 'Bangkok';
alter table Employee_Payroll add Department varchar(250) not null default 'Fighting';
 

-------------UC9-- Extend table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay.-----------
alter table employee_payroll add Basic_Pay float not null default 0.00;
update Employee_Payroll set Basic_Pay = 8000000.00 where Id=1; 
update Employee_Payroll set Basic_Pay = 5000000.00 where Id=2;
update Employee_Payroll set Basic_Pay = 3000000.00 where Id=3;
update Employee_Payroll set Basic_Pay = 2000000.00 where Id=4;
update Employee_Payroll set Basic_Pay = 5000000.000 where Id=5;

alter table Employee_Payroll add 
								 Deductions float not null default 0.00,
								 Taxable_Pay float not null default 0.00, 
								 Income_Tax float not null default 0.00,
								 Net_Pay float not null default 0.00;
update Employee_Payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax);
select * from employee_payroll;


---------UC10-- Two departments for same employee
insert into Employee_Payroll (Name, Salary, StartDate, Gender, Phone, Address, Department, Basic_Pay, Deductions, Taxable_Pay, Income_Tax)
					  values ('Dhoni', 8000000.00, '2005-07-25', 'M', 143252652, 'Bangkok', 'Dancing', 8000000.00, 1000.00, 2000.00, 1500.00);
update Employee_Payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax);

-----------------------ER Diagram----------------
Create table Department
(
 Dept_Id int foreign key references Employee_Payroll(id),
 Department varchar(100)
 );
 

create table Employee_Address
(
id int primary key,
Current_Address varchar(100),
Permanent_Addres varchar(100) 
);


alter table Employee_Address add foreign key (Id) references employee_payroll(Id);

select * from Employee_Payroll;
select * from Department;
select * from Employee_Address;