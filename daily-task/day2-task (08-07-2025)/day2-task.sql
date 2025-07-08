use training;

-- 1. Create table Customer with columns CUSTOMER_ID VARCHAR(20), FIRSTNAME VARCHAR(10), MIDDLE_NAME VARCHAR(20) , CUSTOMER_CITY VARCHAR(15), CUSTOMER_CONTACT_NO VARCHAR(10), OCCUPATION VARCHAR(10), CUSTOMER_DATE_OF_BIRTH DATE
create table customer (
    CUSTOMER_ID VARCHAR(20),
    FIRSTNAME VARCHAR(10),
    MIDDLE_NAME VARCHAR(20),
    CUSTOMER_CITY VARCHAR(15),
    CUSTOMER_CONTACT_NO VARCHAR(10),
    OCCUPATION VARCHAR(10),
    CUSTOMER_DATE_OF_BIRTH DATE
);

-- 2. Add column lastname varchar(20).
alter table customer add column LASTNAME VARCHAR(20);

-- 3. Modify the column size of firstname to 30.
alter table customer modify column FIRSTNAME VARCHAR(30);

-- 4. Drop the column middle_name.
alter table customer drop column MIDDLE_NAME;

-- 5. Insert some rows into customer table.
insert into customer (CUSTOMER_ID, FIRSTNAME, LASTNAME, CUSTOMER_CITY, CUSTOMER_CONTACT_NO, OCCUPATION, CUSTOMER_DATE_OF_BIRTH) values
('C001', 'John', 'Doe', 'Chennai', '9876543210', 'Engineer', '1990-05-12'),
('C002', 'Jane', 'Smith', 'Mumbai', '9123456780', 'Doctor', '1985-11-23'),
('C003', 'Arun', 'Kumar', 'Chennai', '9988776655', 'Teacher', '1992-07-30'),
('C004', 'Priya', 'Sharma', 'Delhi', '9012345678', 'Designer', '1988-03-15');

-- 6. Create table account with columns account_number VARCHAR(20), customer_number VARCHAR(20), branch_id VARCHAR(10), opening_balance double, account_opening_date DATE, account_type VARCHAR(10), account_status VARCHAR(10)
create table account (
    ACCOUNT_NUMBER VARCHAR(20),
    CUSTOMER_NUMBER VARCHAR(20),
    BRANCH_ID VARCHAR(10),
    OPENING_BALANCE DOUBLE,
    ACCOUNT_OPENING_DATE DATE,
    ACCOUNT_TYPE VARCHAR(10),
    ACCOUNT_STATUS VARCHAR(10)
);

-- 7. Insert some rows in account table.
insert into account (ACCOUNT_NUMBER, CUSTOMER_NUMBER, BRANCH_ID, OPENING_BALANCE, ACCOUNT_OPENING_DATE, ACCOUNT_TYPE, ACCOUNT_STATUS) values
('A1001', 'C001', 'B001', 8000.00, '2021-01-10', 'Savings', 'Active'),
('A1002', 'C002', 'B002', 12000.00, '2020-03-15', 'Current', 'Active'),
('A1003', 'C003', 'B001', 6000.00, '2022-06-01', 'Savings', 'Inactive'),
('A1004', 'C004', 'B003', 4500.00, '2021-09-20', 'Savings', 'Active');

-- 8. Write a query to display customer’s number, customer’s firstname,lastname and date of birth.
select CUSTOMER_ID, FIRSTNAME, LASTNAME, CUSTOMER_DATE_OF_BIRTH from customer;

-- 9. Write a query to display customers from city Chennai.
select * from customer where CUSTOMER_CITY = 'Chennai';

-- 10.Write a query to display customer id whose opening balance is in the range 5000 to 10000.
select CUSTOMER_NUMBER from account where OPENING_BALANCE between 5000 and 10000;
