create database training;
use training;

-- ----------------------------------------------------------------------------------------------------------------
-- Day 1

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







-- ----------------------------------------------------------------------------------------------------------------
-- Day 2

-- 1.Add primary key constraint to customer_id in customer table.
alter table customer add constraint pk_customer_id primary key (CUSTOMER_ID);

-- 2.Add primary key constraint to account_number in account table.
alter table account add constraint pk_account_number primary key (ACCOUNT_NUMBER);

desc customer;

-- 3.Add foreign key constraint to customer_number in account table which refers customer_id of customer table.
alter table account add constraint fk_customer_number foreign key (CUSTOMER_NUMBER) references customer(CUSTOMER_ID);

-- 4.Write a query to display the number of customer’s from Chennai. Give the count an alias name of Cust_Count.
select count(*) Cust_Count from customer where CUSTOMER_CITY = 'Chennai';

-- 5.Write a query to display  the customer number, customer firstname,account number for the customer’s whose accounts were created after 15th of any month.
select 
    acc.CUSTOMER_NUMBER, 
    cus.FIRSTNAME, 
    acc.ACCOUNT_NUMBER
from account acc
join customer cus on acc.CUSTOMER_NUMBER = cus.CUSTOMER_ID
where day(acc.ACCOUNT_OPENING_DATE) > 15;

-- 6.Write a query to display the number of customers who have registration but no account in the bank. Give the alias name as Count_Customer for number of customers.
select count(*) Count_Customer
from customer
where CUSTOMER_ID not in (select CUSTOMER_NUMBER from account);

-- 7.Create table transaction_details with columns transaction_number VARCHAR(6), account_number VARCHAR(6), date_of_transaction DATE, medium_of_transaction VARCHAR(20), transaction_type VARCHAR(20), transaction_amount double
create table transaction_details (
    TRANSACTION_NUMBER VARCHAR(6),
    ACCOUNT_NUMBER VARCHAR(6),
    DATE_OF_TRANSACTION DATE,
    MEDIUM_OF_TRANSACTION VARCHAR(20),
    TRANSACTION_TYPE VARCHAR(20),
    TRANSACTION_AMOUNT DOUBLE
);

-- 8. Add foreign key constraint to account_number in transaction table which refers account_number of account table.
alter table transaction_details
add constraint fk_account_number foreign key (ACCOUNT_NUMBER)
references account(ACCOUNT_NUMBER);

-- 9.Insert rows in transaction table
insert into transaction_details (TRANSACTION_NUMBER, ACCOUNT_NUMBER, DATE_OF_TRANSACTION, MEDIUM_OF_TRANSACTION, TRANSACTION_TYPE, TRANSACTION_AMOUNT) values
('T001', 'A1001', '2023-01-10', 'Online', 'Deposit', 5000.00),
('T002', 'A1001', '2023-02-12', 'ATM', 'Withdrawal', 2000.00),
('T003', 'A1002', '2023-03-15', 'Branch', 'Deposit', 4000.00),
('T004', 'A1003', '2023-04-20', 'Online', 'Withdrawal', 1000.00),
('T005', 'A1004', '2023-05-25', 'Branch', 'Deposit', 2500.00),
('T006', 'A1001', '2023-06-30', 'ATM', 'Deposit', 1500.00);

-- 10.Write a query to display  the total number of  withdrawals and total number of deposits being done by customer whose customer number ends with 001. The query should display transaction type and the number of transactions. Give an alias name as Trans_Count for number of transactions.  Display the records sorted in ascending order based on transaction type.
select tra.TRANSACTION_TYPE, count(*) Trans_Count
from transaction_details tra
join account acc on tra.ACCOUNT_NUMBER = acc.ACCOUNT_NUMBER
where acc.CUSTOMER_NUMBER like '%001'
group by tra.TRANSACTION_TYPE
order by tra.TRANSACTION_TYPE asc;







-- ----------------------------------------------------------------------------------------------------------------
-- Day 4

-- 1. Find the nth maximum salary from the employee table using correlated subquery.
select distinct SALARY
from employee e1
where (
    select count(distinct SALARY)
    from employee e2
    where e2.SALARY > e1.SALARY
) = 2;

-- 2.Create a function which takes 2 numbers as input and return the maximum value.
delimiter //

create function max_of_two(a double, b double)
returns double
deterministic
begin
    declare result double;
    if a > b then
        set result = a;
    else
        set result = b;
    end if;
    return result;
end;
//

delimiter ;

-- 3.Write a query to display account number and total amount deposited by each account holder ( Including the opening balance ). Give the total amount deposited an alias name of Deposit_Amount.  Display the records in sorted order based on account number.- Use the tables created in the previous handson.
select 
    acc.ACCOUNT_NUMBER,
    sum(coalesce(t.TRANSACTION_AMOUNT, 0)) + acc.OPENING_BALANCE as Deposit_Amount
from account acc
left join transaction_details t
    on acc.ACCOUNT_NUMBER = t.ACCOUNT_NUMBER
    and t.TRANSACTION_TYPE = 'Deposit'
group by acc.ACCOUNT_NUMBER
order by acc.ACCOUNT_NUMBER;

-- 4.Create table branch_master with columns branch_id VARCHAR(6) -primary key, branch_name VARCHAR(30), branch_city VARCHAR(30) and Insert values into branch_master . 
select distinct SALARY
from employee e1
where (
    select count(distinct SALARY)
    from employee e2
    where e2.SALARY > e1.SALARY
) = 2;

-- 5. Add column branch_id in accounts_master and refer as foreign key to branch_id of branch_master.
alter table account
add constraint fk_branch_id foreign key (BRANCH_ID)
references branch_master(BRANCH_ID);









