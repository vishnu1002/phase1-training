use training;

create table employee_table (
	emp_id int, 
    emp_name varchar(50),
    city varchar(50),
    phone int
);

alter table employee_table add column join_date date; -- YYY-MM-DD
alter table employee_table modify column join_data int;
alter table employee_table drop column test;
alter table employee_table add primary key(emp_id);
alter table employee_table change join_date hire_date date;
alter table employee_table rename column join_date to hire_date; 

insert into employee_table (emp_id, emp_name, city, phone, join_date) VALUES
(1001, 'Alice Johnson', 'New York', 212555012, '2023-01-15'),
(1002, 'Bob Smith', 'Los Angeles', 310555019, '2023-01-15'),
(1003, 'Charlie Davis', 'Chicago', 773555035, '2023-01-15'),
(1004, 'Diana Clark', 'Houston', 713555067, '2023-01-15'),
(1005, 'Ethan Brown', 'Phoenix', 602555080, '2023-01-15'),
(1006, 'Fiona White', 'Philadelphia', 215550112, '2023-01-15'),
(1007, 'George Adams', 'San Antonio', 205550221, '2023-01-15'),
(1008, 'Hannah Brooks', 'San Diego', 695550432, '2023-01-15'),
(1009, 'Ian Miller', 'Dallas', 214555789, '2023-01-15'),
(10010, 'Jasmine Lee', 'San Jose', 485550999, '2023-01-15');

-- truncate table employee_table;

-- rename table emm_info to emp_info; 
-- rename table db1.emp_info to db2.emp_info;

-- ---------------------------------------------------------------------------------------------
-- copy all the data to new table

create table employee_copy (
	emp_id int, 
    emp_name varchar(50),
    city varchar(50),
    phone int,
    hire_date date
);

insert into employee_copy select * from emp_info;

-- ---------------------------------------------------------------------------------------------

insert into emp_info (emp_id, emp_name, city, phone, hire_date, salary) values
(1011, 'Kevin Hall', 'Austin', 512550101, '2023-02-01', 72000),
(1012, 'Laura Scott', 'Denver', 303550112, '2023-02-10', 68000),
(1013, 'Mark Evans', 'Seattle', 205550134, '2023-03-05', 75000),
(1014, 'Nina Perez', 'Atlanta', 445550167, '2023-03-20', 69000),
(1015, 'Oscar Reed', 'Miami', 305550178, '2023-04-01', 71000),
(1016, 'Paula Gray', 'Boston', 175550189, '2023-04-15', 67000),
(1017, 'Quinn Morris', 'Detroit', 313550199, '2023-05-05', 73000),
(1018, 'Rachel Turner', 'Minneapolis', 612550210, '2023-05-25', 74000),
(1019, 'Steve Wilson', 'Portland', 503555222, '2023-06-10', 76000),
(1020, 'Tina Young', 'Orlando', 407555023, '2023-06-30', 70000);


SELECT emp_name, city, salary FROM emp_info ORDER BY city , salary;
