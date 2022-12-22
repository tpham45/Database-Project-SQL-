drop database if exists group2;
create database group2;
use group2;

create table employee(
 employee_id      INT(5),
 first_name     VARCHAR(25),
 last_name VARCHAR(25),
 phone_number VARCHAR(50),
 email  VARCHAR(25),
PRIMARY KEY(employee_id)
);

INSERT INTO employee VALUES("565","Brenna","Garden","(882) 291-5284","bgarden@pc.com.vn");
INSERT INTO employee VALUES("749","Harry","Austin","(548) 323-4422",'haustin@pc.com.vn');
INSERT INTO employee VALUES("563","Kenyon","Fletcher","(343) 243-3445", 'kfletcher@pc.com.vn');
INSERT INTO employee VALUES("533","Garrett","Nicholas","(454) 434-5334","gnicholas@pc.com.vn");
INSERT INTO employee VALUES("400","Malik","Norton","(334) 343-3533","mnorton@pc.com.vn");

/*----------------------------------------------------------------------------------------*/

create table company_location(
comp_location_id INT (5),
comp_addresss VARCHAR (45),
city VARCHAR(45),
zipcode INT (45),
state VARCHAR (45),
country VARCHAR (25),
PRIMARY KEY(comp_location_id)
);
INSERT INTO company_location VALUES("31","2626 Rutrum Rd","North Las Vegas","89084","Nevada", "The US");
INSERT INTO company_location VALUES("62","600 N Blackwelder Ave",'Edmond',"73034",'Okalhoma','The US');
INSERT INTO company_location VALUES("43","6471 Tortor Rd","Tucson", '85641','Arizona','The US');
INSERT INTO company_location VALUES("97","3726 Arcu Rd","Memphis","37501",'Tennessee','The US');
INSERT INTO company_location VALUES("83","4788 Convallis Rd","Louisville","40018",'Kentucky','The US');

/*----------------------------------------------------------------------------------------*/

CREATE TABLE department(
dept_id int(10),
dept_name VARCHAR(25),
dept_supervisor VARCHAR (25), 
lowest_salary_range VARCHAR (25),
highest_salary_range varchar (25),
PRIMARY KEY (dept_id)
);
INSERT INTO department VALUES("27","Customer Relations",'Laura',"1500","3500");
INSERT INTO department VALUES("38","Financial Risk Management",'Thanh',"6500","10000");
INSERT INTO department VALUES("13","Audit",'Long',"2500","5000");
INSERT INTO department VALUES("40","Payroll",'Hale',"3500","5000");
INSERT INTO department VALUES("12","Human Resources",'Thinh','4000','8500');


/*----------------------------------------------------------------------------------------*/
CREATE TABLE absence(
employee_leave_id int (45),
time_accrued int(5),
leave_start_date date,
leave_return_date date,
reason varchar (25),
primary key (employee_leave_id)

);

INSERT INTO absence VALUES("59","134",'2022-03-28',"2022-03-31","Vacation");
INSERT INTO absence VALUES("89","152",'2022-04-05',"2022-04-11","Vacation");
INSERT INTO absence VALUES("197",'53', "2022-11-19","2022-11-21","Sick");
INSERT INTO absence VALUES("249",'48',"2022-12-07", "2022-12-09","Business trip");
INSERT INTO absence VALUES("735",'120',"2022-11-22","2022-11-27","Sick");

/*----------------------------------------------------------------------------------------*/
CREATE TABLE payroll_weekly (
    payroll_ID INT(5), 
    weekly_hour int(5),
    total_salary_weekly varchar(25),
    employee_id int (5),
    dept_id int (5),
    comp_location_id int(5),
    employee_leave_id int (5),
    PRIMARY KEY (payroll_ID),
    FOREIGN KEY (employee_id) references employee(employee_id),
    FOREIGN KEY (dept_id) references department(dept_id),
    FOREIGN KEY (comp_location_id) references company_location(comp_location_id),
    FOREIGN KEY (employee_leave_id) references absence (employee_leave_id)
);

Insert into payroll_weekly values("1","30","1700","565","27","31","59");
INSERT INTO payroll_weekly VALUES("2","33.3","1800","565",'27',"31","59");
INSERT INTO payroll_weekly VALUES("3","25","2020","565",'27',"31","59");
INSERT INTO payroll_weekly VALUES("4","40","3000","565","27","31","59");
INSERT INTO payroll_weekly VALUES("5","32","3333","565",'27',"31","59");
INSERT INTO payroll_weekly VALUES("6","24","3200","565",'27',"31","59");
INSERT INTO payroll_weekly VALUES("7","31","6500","749",'38',"62","89");
INSERT INTO payroll_weekly VALUES("8","30","7000","749",'38',"62","89");
INSERT INTO payroll_weekly VALUES("9","33","8000","749",'38',"62","89");
INSERT INTO payroll_weekly VALUES("10","26","8300","749",'38',"62","89");
INSERT INTO payroll_weekly VALUES("11","27","10000","749",'38',"62","89");
INSERT INTO payroll_weekly VALUES("12","28","7800","749",'38',"62","89");
INSERT INTO payroll_weekly VALUES("13","29","5000","563",'13',"43","197");
INSERT INTO payroll_weekly VALUES("14","38","2500","563",'13',"43","197");
Insert into payroll_weekly values("15","37","3320","563","13","43","197");
INSERT INTO payroll_weekly VALUES("16","36","3100","563",'13',"43","197");
INSERT INTO payroll_weekly VALUES("17","35","4000","563",'13',"43","197");
INSERT INTO payroll_weekly VALUES("18","34","4300","563","13","43","197");
INSERT INTO payroll_weekly VALUES("19","33","3623","533",'40',"97","249");
INSERT INTO payroll_weekly VALUES("20","39","4233","533",'40',"97","249");
INSERT INTO payroll_weekly VALUES("21","23","3533","533",'40',"97","249");
INSERT INTO payroll_weekly VALUES("22","22","4333","533",'40',"97","249");
INSERT INTO payroll_weekly VALUES("23","41","3535","533",'40',"97","249");
INSERT INTO payroll_weekly VALUES("24","42","3565","533",'40',"97","249");
INSERT INTO payroll_weekly VALUES("25","43","4000","400",'12',"83","735");
INSERT INTO payroll_weekly VALUES("26","28","8500","400",'12',"83","735");
INSERT INTO payroll_weekly VALUES("27","43","4544","400",'12',"83","735");
INSERT INTO payroll_weekly VALUES("28","22","5654","400",'12',"83","735");
INSERT INTO payroll_weekly VALUES("29","45","6756","400",'12',"83","735");
INSERT INTO payroll_weekly VALUES("30","46","5494","400",'12',"83","735");


Select payroll_weekly.payroll_ID, employee.first_name, employee.last_name, payroll_weekly.weekly_hour,payroll_weekly.total_salary_weekly
From payroll_weekly
join employee on payroll_weekly.employee_id=employee.employee_id;
/*----------------------------------------------------------------------------------------*/
select payroll_weekly.payroll_ID,company_location.city, company_location.zipcode, department.lowest_salary_range, department.highest_salary_range
from payroll_weekly
right join company_location on payroll_weekly.comp_location_id = company_location.comp_location_id 
inner join department on payroll_weekly.dept_id = department.dept_id;
/*----------------------------------------------------------------------------------------*/

select payroll_weekly.payroll_ID,absence.leave_start_date,absence.leave_return_date,absence.time_accrued, payroll_weekly.total_salary_weekly
from absence
left join payroll_weekly on payroll_weekly. employee_leave_id = absence.employee_leave_id ;
/*----------------------------------------------------------------------------------------*/

select payroll_weekly.payroll_ID, employee.first_name, employee.last_name, department.dept_name, payroll_weekly.total_salary_weekly
from payroll_weekly
join employee on payroll_weekly.employee_id=employee.employee_id
join department on payroll_weekly.dept_id = department.dept_id;
/*----------------------------------------------------------------------------------------*/

select SUM(payroll_weekly.total_salary_weekly) as "Total salary from payroll" from payroll_weekly;
select avg(payroll_weekly.total_salary_weekly)as"Average payroll" from payroll_weekly;
/*----------------------------------------------------------------------------------------*/

SELECT COUNT(payroll_ID) as "Number of payroll" ,first_name
FROM payroll_weekly
join employee on payroll_weekly.employee_id=employee.employee_id
where payroll_weekly. employee_id in ( 749,400,533)
GROUP BY first_name
HAVING COUNT(payroll_id) 
ORDER BY COUNT(payroll_id) DESC;
/*----------------------------------------------------------------------------------------*/

INSERT INTO payroll_weekly VALUE ("31","50","2123","400","12","83","735");
delete FROM payroll_weekly WHERE payroll_weekly.payroll_id="31";


Select payroll_weekly.payroll_ID, employee.first_name, employee.last_name, payroll_weekly.weekly_hour,payroll_weekly.total_salary_weekly
From payroll_weekly
join employee on payroll_weekly.employee_id=employee.employee_id;
/*----------------------------------------------------------------------------------------*/
select payroll_weekly.payroll_ID,company_location.city, company_location.zipcode, department.lowest_salary_range, department.highest_salary_range
from payroll_weekly
right join company_location on payroll_weekly.comp_location_id = company_location.comp_location_id 
inner join department on payroll_weekly.dept_id = department.dept_id;
/*----------------------------------------------------------------------------------------*/

select payroll_weekly.payroll_ID,absence.leave_start_date,absence.leave_return_date,absence.time_accrued, payroll_weekly.total_salary_weekly
from absence
left join payroll_weekly on payroll_weekly. employee_leave_id = absence.employee_leave_id ;
/*----------------------------------------------------------------------------------------*/

select payroll_weekly.payroll_ID, employee.first_name, employee.last_name, department.dept_name, payroll_weekly.total_salary_weekly
from payroll_weekly
join employee on payroll_weekly.employee_id=employee.employee_id
join department on payroll_weekly.dept_id = department.dept_id;
/*----------------------------------------------------------------------------------------*/

select SUM(payroll_weekly.total_salary_weekly) as "Total salary from payroll" from payroll_weekly;
select avg(payroll_weekly.total_salary_weekly)as"Average payroll" from payroll_weekly;
/*----------------------------------------------------------------------------------------*/

SELECT COUNT(payroll_ID) as "Number of payroll" ,first_name
FROM payroll_weekly
join employee on payroll_weekly.employee_id=employee.employee_id
where payroll_weekly. employee_id in ( 749,400,533)
GROUP BY first_name
HAVING COUNT(payroll_id) 
ORDER BY COUNT(payroll_id) DESC;

/*----------------------------------------------------------------------------------------*/
INSERT INTO payroll_weekly VALUE ("31","50","2123","400","12","83","735");
delete FROM payroll_weekly WHERE payroll_weekly.payroll_id="31";
/*Query for modifying extra stuff


