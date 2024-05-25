-- CREATE DATABASE
create database hr_database;

-- USE DATABASE
use hr_database;


-- CREATE TABLE
create table hr_data12(
emp_no int8 primary key,
gender varchar(50),
marital_status varchar(50),
age_band varchar(50),
age	int8,
department varchar(50),
education varchar(50),
education_field varchar(50),
job_role varchar(50),
business_travel varchar(50),
employee_count varchar(50),
attrition varchar(50),
attrition_label varchar(50),
job_satisfaction int8,
active_employee int8
);


-- IMPORT table from FOLDER

-- REVIEW THE TABLE
select * from hr_database.hr_data12;
select count(emp_no) from hr_data12;


-- total number of employees,department having associates degree
select count(employee_count) as emp_count from hr_data12
where education = 'associates degree';


-- total no. of attrition count in "R&D" department having "associates degree"
select count(attrition) as attrition_count from hr_data12
where department = 'R&D' and active_employee = "0" and education = "associates degree";


-- total no of emplyee giving rating as 4 and having "bachelor's degree" in department "sales"
select count(job_satisfaction) as rating_job from hr_data12
where education = "bachelor's degree" and job_satisfaction = 4 and department = "sales";


-- attrition_rate 
select round(((select count(attrition) from hr_data12 where attrition = "yes")/sum(employee_count)) * 100,0) 
as attrition_rate from hr_data12;


-- no. of active employee
select sum(employee_count) - (select count(attrition) from hr_data12
where attrition = "yes" and gender = "male") as active_emp  from hr_data12 where gender = "male";


-- average age
select round(avg(age),0) from hr_data12; 


-- attrition by gender
select gender,count(attrition) from hr_data12 where attrition = "yes"
group by gender;


-- department wise attrition
select department, count(attrition) from hr_data12 
where attrition = "yes" and gender = "female" 
group by department
order by count(attrition);


-- age wise employee count
select age ,sum(employee_count) from hr_data12
group by age
order by age;


-- education_field wise attrition
select education_field, count(attrition) from hr_data12
where attrition = "yes" 
group by education_field
order by count(attrition);


-- attrition count by gender for differrent age_band
select age_band, gender,count(attrition) from hr_data12 
where attrition = "yes"
group by gender, age_band
order by age_band;
order by age_band;