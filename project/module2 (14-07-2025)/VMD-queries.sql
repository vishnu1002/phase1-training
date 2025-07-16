use VMD;

-- Queries:
-- 1. Write a query to display movie names and number of times that movie is issued to customers. In case movies are never issued to customers display number of times as 0. Display the details in sorted order based on number of times (in descending order) and then by movie name (in ascending order). The Alias name for the number of movies issued is ISSUE_COUNT.
select M.MOVIE_NAME, count(CI.ISSUE_ID) as ISSUE_COUNT from MOVIES_MASTER M
left join CUSTOMER_ISSUE_DETAILS CI on M.MOVIE_ID = CI.MOVIE_ID
group by M.MOVIE_ID, M.MOVIE_NAME
order by ISSUE_COUNT desc, M.MOVIE_NAME asc;

-- 2. Write a query to display id, name, age, contact no of customers whose age is greater than 25 and who have registered in the year 2012.  Display contact no in the below format +91-XXX-XXX-XXXX example +91-987-678-3434 and use the alias name as "CONTACT_ISD". If the contact no is null then display as 'N/A' Sort all the records in ascending order based on age and then by name. Customers age > 25 and registered in 2012 with formatted contact number
select * from CUSTOMER_MASTER;
select CUSTOMER_ID, CUSTOMER_NAME, AGE, DATE_OF_REGISTRATION,
case 
	when CONTACT_NO is not null 
    then concat('+91-', 
		 SUBSTRING(CONTACT_NO, 1, 3), '-', 
		 SUBSTRING(CONTACT_NO, 4, 3), '-', 
		 SUBSTRING(CONTACT_NO, 7, 4)) -- +91-000-000-0000
	else 'N/A'
end as CONTACT_ISD
from CUSTOMER_MASTER
where AGE > 25 and year(DATE_OF_REGISTRATION) = 2012
order by AGE asc, CUSTOMER_NAME asc;

-- 3. Write a query to display the movie category and number of movies in that category. Display records based on number of movies from higher to lower order and then by movie category in ascending order. Hint: Use NO_OF_MOVIES as alias name for number of movies.
select MOVIE_CATEGORY, count(*) AS NO_OF_MOVIES from MOVIES_MASTER
group by MOVIE_CATEGORY
order by NO_OF_MOVIES desc, MOVIE_CATEGORY asc;

-- 4. Write a query to display the number of customers having card with description “Gold card”. Use CUSTOMER_COUNT as alias name for number of customers.
select * from library_card_master;
select count(*) AS CUSTOMER_COUNT from CUSTOMER_CARD_DETAILS CCD
join LIBRARY_CARD_MASTER LCM on CCD.CARD_ID = LCM.CARD_ID
where LCM.DESCRIPTION = 'gold card';

-- 5. Write a query to display the customer id, customer name, year of registration, library card id, card issue date of all the customers who hold library card. Display the records sorted by customer name in descending order. Use REGISTERED_YEAR as alias name for year of registration.
select CM.CUSTOMER_ID, CM.CUSTOMER_NAME, CM.DATE_OF_REGISTRATION as REGISTERED_YEAR, CCD.CARD_ID, year(CCD.ISSUE_DATE)
from CUSTOMER_MASTER CM
join CUSTOMER_CARD_DETAILS CCD on CM.CUSTOMER_ID = CCD.CUSTOMER_ID
order by CM.CUSTOMER_NAME desc;

-- 6. Write a query to display issue id, customer id, customer name for the customers who have paid fine and whose name starts with 'R'. Fine is calculated based on return date and actual date of return.  If the date of actual return is after date of return then fine need to be paid by the customer. Display the records sorted in ascending order based on customer name. fine = actual date > return date
select CID.ISSUE_ID, CM.CUSTOMER_ID, CM.CUSTOMER_NAME
from CUSTOMER_ISSUE_DETAILS CID
join CUSTOMER_MASTER CM on CID.CUSTOMER_ID = CM.CUSTOMER_ID
where CM.CUSTOMER_NAME like 'r%' and CID.ACTUAL_DATE_RETURN > CID.RETURN_DATE
order by CM.CUSTOMER_NAME asc;

-- 7. Write a query to display customer id, customer name, card id, card description and card amount in dollars of customers who have taken movie on the same day the library card is registered. For Example Assume John registered a library card on 12th Jan 2013 and he took a movie on 12th Jan 2013 then display his details.  AMOUNT_DOLLAR = amount/85.8 and round it to zero decimal places and display as $Amount. Example Assume 500 is the amount then dollar value will be $10. Use AMOUNT_DOLLAR as alias name for amount in dollar. Display the records in ascending order based on customer name. customer who took movie on the same day library card issued.
select * from CUSTOMER_MASTER;
select * from CUSTOMER_CARD_DETAILS;
select * from LIBRARY_CARD_MASTER;
select * from CUSTOMER_ISSUE_DETAILS;

insert into CUSTOMER_ISSUE_DETAILS values ('i99999', 'c00001', 'm00002', '2012-05-13', '2012-05-15', '2012-05-15');

select CM.CUSTOMER_ID, CM.CUSTOMER_NAME, CCD.CARD_ID, LCM.DESCRIPTION, concat('$', round(LCM.AMOUNT / 85.8, 0)) as AMOUNT_DOLLAR
from CUSTOMER_MASTER CM
join CUSTOMER_CARD_DETAILS CCD on CM.CUSTOMER_ID = CCD.CUSTOMER_ID
join LIBRARY_CARD_MASTER LCM on CCD.CARD_ID = LCM.CARD_ID
join CUSTOMER_ISSUE_DETAILS CID on CM.CUSTOMER_ID = CID.CUSTOMER_ID
where CCD.ISSUE_DATE = CID.ISSUE_DATE
order by CM.CUSTOMER_NAME asc;

-- 8. Write a query to display the customer name and number of movies issued to that customer sorted by customer name in ascending order. If a customer has not been issued with any movie then display 0. Use MOVIE_COUNT as alias name for number of movies issued.
select CM.CUSTOMER_NAME, count(CID.ISSUE_ID) as MOVIE_COUNT
from CUSTOMER_MASTER CM
left join CUSTOMER_ISSUE_DETAILS CID on CM.CUSTOMER_ID = CID.CUSTOMER_ID
group by CM.CUSTOMER_ID, CM.CUSTOMER_NAME
order by CM.CUSTOMER_NAME asc;

-- 9. Write a query to display the issue id, issue date, customer id, customer name and contact number for videos that are issued in the year 2013. Display the records in descending order based on issue date of the video.
select CID.ISSUE_ID, CID.ISSUE_DATE, CM.CUSTOMER_ID, CM.CUSTOMER_NAME, CM.CONTACT_NO
from CUSTOMER_ISSUE_DETAILS CID
join CUSTOMER_MASTER CM on CID.CUSTOMER_ID = CM.CUSTOMER_ID
where year(CID.ISSUE_DATE) = 2013
order by CID.ISSUE_DATE desc;

-- 10. Write a query to display the director's name, number of movies directed by the director who directed more than one movie. Display the director name in capital letters. Use DIRECTOR_NAME as alias name for director name column Display the records sorted in ascending order based on director_name.
-- select * from MOVIES_MASTER where DIRECTOR = 'christopher nolan';
select upper(DIRECTOR) as DIRECTOR_NAME, count(*) as MOVIE_COUNT
from MOVIES_MASTER
group by DIRECTOR
having count(*) > 1
order by DIRECTOR_NAME asc;


