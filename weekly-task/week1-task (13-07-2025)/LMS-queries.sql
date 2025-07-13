use lms;

-- Simple Questions ----------------------------------------------------------------------------------------------

-- Problem # 1:
-- Write a query to display the member id, member name, city and membership status who are all having life time membership. Hint: Life time membership status is “Permanent”.

SELECT member_id, member_name, city, membership_status
FROM LMS_MEMBERS
WHERE membership_status = 'Permanent';

-- Problem # 2:
-- Write a query to display the member id, member name who have not returned the books. Hint: Book return status is book_issue_status ='Y' or 'N'.

SELECT DISTINCT m.member_id, m.member_name
FROM LMS_MEMBERS m
JOIN LMS_BOOK_ISSUE b ON m.member_id = b.member_id
WHERE b.book_issue_status = 'N';

-- Problem # 3:
-- Write a query to display the member id, member name who have taken the book with book code 'BL000002'.

SELECT DISTINCT m.member_id, m.member_name
FROM LMS_MEMBERS m
JOIN LMS_BOOK_ISSUE b ON m.member_id = b.member_id
WHERE b.book_code = 'BL000002';

-- Problem # 4:
-- Write a query to display the book code, book title and author of the books whose author name begins with 'P'.

SELECT book_code, book_title, author
FROM LMS_BOOK_DETAILS
WHERE author LIKE 'P%';

-- Problem # 5:
-- Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’.

SELECT COUNT(*) AS NO_OF_BOOKS
FROM LMS_BOOK_DETAILS
WHERE category = 'JAVA';

-- Problem # 6:
-- Write a query to list the category and number of books in each category with alias name ‘NO_OF_BOOKS’.

SELECT category, COUNT(*) AS NO_OF_BOOKS
FROM LMS_BOOK_DETAILS
GROUP BY category;

-- Problem # 7:
-- Write a query to display the number of books published by "Prentice Hall” with the alias name “NO_OF_BOOKS”.

SELECT COUNT(*) AS NO_OF_BOOKS
FROM LMS_BOOK_DETAILS
WHERE publication = 'Prentice Hall';

-- Problem # 8:
-- Write a query to display the book code, book title of the books which are issued on the date "1st April 2012"

SELECT bd.book_code, bd.book_title
FROM LMS_BOOK_ISSUE bi
JOIN LMS_BOOK_DETAILS bd ON bi.book_code = bd.book_code
WHERE bi.date_issue = '2012-04-01';

-- Problem # 9:
-- Write a query to display the member id, member name, date of registration and expiry date of the members whose membership expiry date is before APR 2013.

SELECT MEMBER_ID, MEMBER_NAME, DATE_REGISTER, DATE_EXPIRE
FROM LMS_MEMBERS
WHERE DATE_EXPIRE < '2013-04-01';

-- Problem # 10:
-- write a query to display the member id, member name, date of registration, membership status of the members who registered before "March 2012" and membership status is "Temporary"

select MEMBER_ID, MEMBER_NAME, DATE_REGISTER, MEMBERSHIP_STATUS
from LMS_MEMBERS
where DATE_REGISTER < '2012-03-01' and MEMBERSHIP_STATUS = 'Temporary';


-- Problem #11:
-- Write a query to display the member id, member name who’s City is CHENNAI or DELHI. Hint: Display the member name in title case with alias name 'Name'.

select MEMBER_ID, concat(ucase(LEFT(MEMBER_NAME, 1)), lcase(substring(MEMBER_NAME, 2))) AS Name
from LMS_MEMBERS
where CITY in ('CHENNAI', 'DELHI');


-- Problem #12:
-- Write a query to concatenate book title, author and display in the following format. Book_Title_is_written_by_Author
-- Example: Let Us C_is_written_by_Yashavant Kanetkar
-- Hint: display unique books. Use “BOOK_WRITTEN_BY” as alias name.

select distinct concat(BOOK_TITLE, '_is_written_by_', AUTHOR) AS BOOK_WRITTEN_BY
from LMS_BOOK_DETAILS;

-- Problem #13:
-- Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias name “AVERAGEPRICE”.

select avg(PRICE) AS AVERAGEPRICE
from LMS_BOOK_DETAILS
where CATEGORY = 'JAVA';

-- Problem #14:
-- Write a query to display the supplier id, supplier name and email of the suppliers who are all having gmail account.

select SUPPLIER_ID, SUPPLIER_NAME, EMAIL
from LMS_SUPPLIERS_DETAILS
where EMAIL like '%@gmail.com';

-- Problem#15:
-- Write a query to display the supplier id, supplier name and contact details. Contact details can be either phone
-- number or email or address with alias name “CONTACTDETAILS”. If phone number is null then display email,
-- even if email also null then display the address of the supplier. Hint: Use Coalesce function.

select SUPPLIER_ID, SUPPLIER_NAME,
coalesce(cast(CONTACT AS CHAR), EMAIL, ADDRESS) AS CONTACTDETAILS
from LMS_SUPPLIERS_DETAILS;

-- Problem#16:
-- Write a query to display the supplier id, supplier name and contact. If phone number is null then display ‘No’ else display ‘Yes’ with alias name “PHONENUMAVAILABLE”. Hint: Use NVL2.

select SUPPLIER_ID, SUPPLIER_NAME,
if(CONTACT is NOT NULL, 'Yes', 'No') AS PHONENUMAVAILABLE
from LMS_SUPPLIERS_DETAILS;

-- Average Questions ----------------------------------------------------------------------------------------------

-- Problem # 1:
-- Write a query to display the member id, member name of the members, book code and book title of the books taken by them.

select M.MEMBER_ID, M.MEMBER_NAME, B.BOOK_CODE, D.BOOK_TITLE
from LMS_MEMBERS M
join LMS_BOOK_ISSUE B on M.MEMBER_ID = B.MEMBER_ID
join LMS_BOOK_DETAILS D on B.BOOK_CODE = D.BOOK_CODE;

-- Problem # 2:
-- Write a query to display the total number of books available in the library with alias name
-- “NO_OF_BOOKS_AVAILABLE” (Which is not issued). Hint: The issued books details are available in the LMS_BOOK_ISSUE table.

select count(*) AS NO_OF_BOOKS_AVAILABLE
from LMS_BOOK_DETAILS
where BOOK_CODE not in (
    select distinct BOOK_CODE from LMS_BOOK_ISSUE
);

-- Problem # 3:
-- Write a query to display the member id, member name, fine range and fine amount of the members whose fine amount is less than 100.

select M.MEMBER_ID, M.MEMBER_NAME, F.FINE_RANGE, F.FINE_AMOUNT
from LMS_MEMBERS M
join LMS_BOOK_ISSUE B ON M.MEMBER_ID = B.MEMBER_ID
join LMS_FINE_DETAILS F ON B.FINE_RANGE = F.FINE_RANGE
where F.FINE_AMOUNT < 100;

-- Problem # 4:
-- Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is
-- "6”. Show the availability status with alias name “AVAILABILITYSTATUS”. Hint: Book availability status can be fetched from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table.

select D.BOOK_CODE, D.BOOK_TITLE,
       if(B.BOOK_ISSUE_STATUS IS NULL, 'Available', 'Issued') AS AVAILABILITYSTATUS
from LMS_BOOK_DETAILS D
left join LMS_BOOK_ISSUE B ON D.BOOK_CODE = B.BOOK_CODE
where D.CATEGORY = 'JAVA' AND D.BOOK_EDITION = 6;

-- Problem # 5:
-- Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' and sort by book title in ascending order.

select BOOK_CODE, BOOK_TITLE, RACK_NUM
from LMS_BOOK_DETAILS
where RACK_NUM = 'A1'
order by BOOK_TITLE ASC;

-- Problem # 6:
-- Write a query to display the member id, member name, due date and date returned of the members who has
-- returned the books after the due date. Hint: Date_return is due date and Date_returned is actual book return date. 

select M.MEMBER_ID, M.MEMBER_NAME, B.DATE_RETURN, B.DATE_RETURNED
from LMS_BOOK_ISSUE B
join LMS_MEMBERS M ON B.MEMBER_ID = M.MEMBER_ID
where B.DATE_RETURNED > B.DATE_RETURN;

-- Problem # 7:
-- Write a query to display the member id, member name and date of registration who have not taken any book.

select M.MEMBER_ID, M.MEMBER_NAME, M.DATE_REGISTER
from LMS_MEMBERS M
where M.MEMBER_ID NOT IN (
    select distinct MEMBER_ID from LMS_BOOK_ISSUE
);

-- Problem # 8:
-- Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.

select distinct M.MEMBER_ID, M.MEMBER_NAME
from LMS_MEMBERS M
where M.MEMBER_ID NOT IN (
    select B.MEMBER_ID
    from LMS_BOOK_ISSUE B
    where year(B.DATE_RETURNED) = 2012
);

-- Problem # 9:
-- Write a query to display the date on which the maximum numbers of books were issued and the number of books issued with alias name “NOOFBOOKS”.

select DATE_ISSUE, count(*) AS NOOFBOOKS
from LMS_BOOK_ISSUE
group by DATE_ISSUE
order by NOOFBOOKS DESC
limit 1;

-- Problem # 10:
-- Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’.

select BOOK_TITLE, SUPPLIER_ID
from LMS_BOOK_DETAILS
where AUTHOR = 'Herbert Schildt' and BOOK_EDITION = 5 and SUPPLIER_ID = 'S01';

-- Problem # 11:
-- Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS” and sort by rack number in ascending order.

select RACK_NUM, COUNT(*) AS NOOFBOOKS
from LMS_BOOK_DETAILS
group by RACK_NUM
order by RACK_NUM ASC;

-- Problem # 12:
-- Write a query to display book issue number, member name, date or registration, date of expiry, book title,
-- category author, price, date of issue, date of return, actual returned date, issue status, fine amount.

select B.BOOK_ISSUE_NO, M.MEMBER_NAME, M.DATE_REGISTER, M.DATE_EXPIRE,
       D.BOOK_TITLE, D.CATEGORY, D.AUTHOR, D.PRICE,
       B.DATE_ISSUE, B.DATE_RETURN, B.DATE_RETURNED,
       B.BOOK_ISSUE_STATUS, F.FINE_AMOUNT
from LMS_BOOK_ISSUE B
join LMS_MEMBERS M ON B.MEMBER_ID = M.MEMBER_ID
join LMS_BOOK_DETAILS D ON B.BOOK_CODE = D.BOOK_CODE
join LMS_FINE_DETAILS F ON B.FINE_RANGE = F.FINE_RANGE;

-- Problem # 13:
-- Write a query to display the book code, title, publish date of the books which is been published in the month of December.

select BOOK_CODE, BOOK_TITLE, PUBLISH_DATE
from LMS_BOOK_DETAILS
where month(PUBLISH_DATE) = 12;

-- Problem # 14:
-- Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is
-- "5”. Show the availability status with alias name “AVAILABILITYSTATUS”. Hint: Book availability status can be
-- fetched from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table. 

select D.BOOK_CODE, D.BOOK_TITLE,
if(B.BOOK_ISSUE_STATUS IS NULL, 'Available', 'Issued') AS AVAILABILITYSTATUS
from LMS_BOOK_DETAILS D
left join LMS_BOOK_ISSUE B ON D.BOOK_CODE = B.BOOK_CODE
where D.CATEGORY = 'JAVA' AND D.BOOK_EDITION = 5;

-- Complex Questions ----------------------------------------------------------------------------------------------

-- Problem # 1:
-- Write a query to display the book code, book title and supplier name of the supplier who has supplied
-- maximum number of books. For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 2 books
-- and “XYZ Store” has supplied 1 book. So “ABC Store” has supplied maximum number of books, hence display
-- the details as mentioned below.
-- Example:
-- BOOK_CODE BOOK_TITLE SUPPLIER_NAME
-- BL000008 Easy Reference for Java ABC STORE
-- BL000001 Easy Reference for C ABC STORE
-- BL000003 Easy Reference for VB ABC STORE

SELECT bd.book_code, bd.book_title, sd.supplier_name
FROM LMS_BOOK_DETAILS bd
JOIN LMS_SUPPLIERS_DETAILS sd ON bd.supplier_id = sd.supplier_id
WHERE bd.supplier_id = (
    SELECT supplier_id
    FROM LMS_BOOK_DETAILS
    GROUP BY supplier_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Problem # 2:
-- Write a query to display the member id, member name and number of remaining books he/she can take with
-- “REMAININGBOOKS” as alias name. Hint: Assuming a member can take maximum 3 books. For example,
-- Ramesh has already taken 2 books; he can take only one book now. Hence display the remaining books as 1 in
-- below format.
-- Example:
-- MEMBER_ID MEMBER_NAME REMAININGBOOKS
-- LM001 RAMESH 1
-- LM002 MOHAN 3

select m.member_id, m.member_name,
       (3 - ifnull(count(b.book_code), 0)) AS REMAININGBOOKS
from LMS_MEMBERS m
left join LMS_BOOK_ISSUE b ON m.member_id = b.member_id
group by m.member_id, m.member_name;

-- Problem # 3
-- Write a query to display the supplier id and supplier name of the supplier who has supplied minimum number
-- of books. For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 2 books and “XYZ Store” has
-- supplied 1 book. So “XYZ Store” has supplied minimum number of books, hence display the details as
-- mentioned below.
-- Example:
-- SUPPLIER_ID SUPPLIER_NAME
-- S04 XYZ STORE
-- First, find the supplier(s) who supplied the least books

select sd.supplier_id, sd.supplier_name
from LMS_SUPPLIERS_DETAILS sd
where sd.supplier_id = (
    select supplier_id
    from LMS_BOOK_DETAILS
    group by supplier_id
    order by COUNT(*) ASC
    limit 1
);



