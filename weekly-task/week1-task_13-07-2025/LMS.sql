create database lms; 
use lms;

-- LMS_MEMBERS table
create table LMS_MEMBERS (
	MEMBER_ID varchar(10) primary key,
    MEMBER_NAME varchar(30) not null,
    CITY varchar(20) not null,
    DATE_REGISTER date not null,
    DATE_EXPIRE date not null,
    MEMBERSHIP_STATUS varchar(15)
);

insert into LMS_MEMBERS (MEMBER_ID, MEMBER_NAME, CITY, DATE_REGISTER, DATE_EXPIRE, MEMBERSHIP_STATUS) values
('LM001', 'AMIT', 'CHENNAI', ('2012-02-20'), ('2013-11-02'),'Temporary'),
('LM002', 'ABDHUL', 'DELHI', ('2012-04-10'),('2013-04-09'),'Temporary'),
('LM003', 'GAYAN', 'CHENNAI', ('2013-05-12'),('2013-05-14'), 'Permanent'),
('LM004', 'RADHA', 'CHENNAI', ('2012-04-22'), ('2013-04-21'), 'Temporary'),
('LM005', 'GURU', 'BANGALORE', ('2012-03-30'), ('2013-03-29'),'Temporary'),
('LM006', 'MOHAN', 'CHENNAI', ('2012-04-12'), ('2013-04-12'),'Temporary');

select * from LMS_MEMBERS;

-- LMS_SUPPLIERS_DETAILS table
create table LMS_SUPPLIERS_DETAILS (
    supplier_id VARCHAR(3) PRIMARY KEY,
    supplier_name VARCHAR(30),
    address VARCHAR(50),
    contact BIGINT,
    email VARCHAR(50)
);

insert into LMS_SUPPLIERS_DETAILS (supplier_id, supplier_name, address, contact, email) values
('S01', 'SINGAPORE SHOPPEE', 'CHENNAI', 989412355, 'sing@gmail.com'),
('S02', 'JK Stores', 'MUMBAI', 994012345, 'jks@yahoo.com'),
('S03', 'ROSE BOOK STORE', 'TRIVANDRUM', 944441122, 'rose@gmail.com'),
('S04', 'KAVARI STORE', 'DELHI', 863000145, 'kavi@redif.com'),
('S05', 'EINSTEN BOOK GALLARY', 'US', 954200001, 'eingal@aol.com'),
('S06', 'AKBAR STORE', 'MUMBAI', 785562310, 'akbakst@aol.com');

select * from LMS_SUPPLIERS_DETAILS;

-- LMS_FINE_DETAILS table
create table LMS_FINE_DETAILS (
    fine_range VARCHAR(3) PRIMARY KEY,
    fine_amount DECIMAL(10,2)
);

insert into LMS_FINE_DETAILS (fine_range, fine_amount) values
('R1', 20),
('R2', 50),
('R3', 75),
('R4', 100),
('R5', 150),
('R6', 200);

select * from LMS_FINE_DETAILS;

-- LMS_BOOK_DETAILS table
create table LMS_BOOK_DETAILS (
    book_code VARCHAR(10) PRIMARY KEY,
    book_title VARCHAR(50),
    category VARCHAR(15),
    author VARCHAR(30),
    publication VARCHAR(30),
    publish_date DATE,
    book_edition INT,
    price DECIMAL(10,2),
    rack_num VARCHAR(3),
    date_arrival DATE,
    supplier_id VARCHAR(3),
    FOREIGN KEY (supplier_id) REFERENCES LMS_SUPPLIERS_DETAILS(supplier_id)
);

insert into LMS_BOOK_DETAILS (book_code, book_title, category, author, publication, publish_date, book_edition, price, rack_num, date_arrival, supplier_id) values
('BL000001', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-10-12', 6, 600.00, 'A1', '2011-10-05', 'S01'),
('BL000002', 'Java: The Complete Reference', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill', '2011-10-10', 5, 750.00, 'A1', '2011-10-05', 'S03'),
('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-02-10', 6, 600.00, 'A1', '2012-05-12', 'S01'),
('BL000004', 'Java: The Complete Reference', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill', '2011-10-10', 5, 750.00, 'A1', '2012-05-12', 'S01'),
('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 600.00, 'A1', '2012-05-12', 'S01'),
('BL000006', 'Java: The Complete Reference', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill', '2011-10-10', 5, 750.00, 'A1', '2012-05-12', 'S03'),
('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar', 'BPB Publications', '2010-12-11', 9, 500.00, 'A3', '2010-01-03', 'S03'),
('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar', 'BPB Publications', '2010-12-11', 9, 500.00, 'A3', '2010-01-03', 'S04');

select * from LMS_BOOK_DETAILS;

-- LMS_BOOK_ISSUE table
create table LMS_BOOK_ISSUE (
    book_issue_no INT PRIMARY KEY,
    member_id VARCHAR(10),
    book_code VARCHAR(10),
    date_issue DATE,
    date_return DATE,
    date_returned DATE,
    book_issue_status CHAR(1),
    fine_range VARCHAR(3),
    FOREIGN KEY (member_id) REFERENCES LMS_MEMBERS(member_id),
    FOREIGN KEY (book_code) REFERENCES LMS_BOOK_DETAILS(book_code),
    FOREIGN KEY (fine_range) REFERENCES LMS_FINE_DETAILS(fine_range)
);

insert into LMS_BOOK_ISSUE (book_issue_no, member_id, book_code, date_issue, date_return, date_returned, book_issue_status, fine_range) values
(001, 'LM001', 'BL000001', '2012-05-01', '2012-05-16', '2012-05-16', 'N', 'R1'),
(002, 'LM002', 'BL000002', '2012-02-12', '2012-06-06', '2012-11-01', 'N', 'R2'),
(003, 'LM003', 'BL000007', '2012-04-19', '2012-05-06', '2012-10-05', 'Y', 'R1'),
(004, 'LM004', 'BL000005', '2012-05-01', '2012-05-16', '2012-05-16', 'Y', 'R1'),
(005, 'LM005', 'BL000008', '2012-07-11', '2012-08-16', '2012-08-19', 'N', 'R2');

select * from LMS_BOOK_ISSUE;



