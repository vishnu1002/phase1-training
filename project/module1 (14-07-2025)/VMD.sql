create database vmd;
use vmd;

-- CUSTOMER_MASTER Table
CREATE TABLE CUSTOMER_MASTER (
    CUSTOMER_ID VARCHAR(10),
    CUSTOMER_NAME VARCHAR(30) NOT NULL,
    CONTACT_NO BIGINT(20),
    CONTACT_ADD VARCHAR(100),
    DATE_OF_REGISTRATION DATE NOT NULL,
    AGE VARCHAR(15) NOT NULL,
    CONSTRAINT MT_CTS1 PRIMARY KEY (CUSTOMER_ID)
);

INSERT INTO CUSTOMER_MASTER (CUSTOMER_ID, CUSTOMER_NAME, CONTACT_NO, CONTACT_ADD, DATE_OF_REGISTRATION, AGE) VALUES
('c00001','nitin','9830354218','a/122, kalkaji','2012-10-15','22'),
('c00002','agnesh','8923156781','9/1,andheri east','2012-11-01','35'),
('c00003','t ramachandran','9831289761','9/1,nandabakkam','2012-11-02','25'),
('c00004','rajib mitra','9830356781','h/56, block1,jadavpur','2012-11-21','45'),
('c00005','shiv prasad',NULL,'2/2 phase ii jawahar nagar','2012-12-25','30'),
('c00006','ajay ghosh','8763478901','n/2,gandhi colony dum dum','2012-12-30','20'),
('c00007','geetha reddy','8976167890','ah 1/1 t nagar','2012-12-31','30'),
('c00008','ria natrajan','9856723190','a/b gandhi colony','2013-01-01','45'),
('c00009','rajan pillai',NULL,'a 1/66 kodambakkam','2013-01-02','40'),
('c00010','raghav singh','9675167890','a/6 nehru jawahar nagar','2013-03-02','50'),
('c00011','raj sekhanran','8423178906','a/1 mayur kunj','2013-03-15','25');

select * from CUSTOMER_MASTER;

-- MOVIES_MASTER Table
CREATE TABLE MOVIES_MASTER (
    MOVIE_ID VARCHAR(10),
    MOVIE_NAME VARCHAR(80) NOT NULL,
    RELEASE_DATE VARCHAR(30) NOT NULL,
    LANGUAGE VARCHAR(30),
    RATING INT(2),
    DURATION_IN_MINUTES VARCHAR(10) NOT NULL,
    MOVIE_TYPE VARCHAR(100),
    MOVIE_CATEGORY VARCHAR(40) NOT NULL,
    DIRECTOR VARCHAR(60) NOT NULL,
    LEAD_ACTOR_NAME1 VARCHAR(50) NOT NULL,
    LEAD_ACTOR_NAME2 VARCHAR(60) NOT NULL,
    RENTAL_COST BIGINT(10),
    CONSTRAINT MT_CTS4 PRIMARY KEY (MOVIE_ID)
);

INSERT INTO MOVIES_MASTER (MOVIE_ID, MOVIE_NAME, RELEASE_DATE, LANGUAGE, RATING, DURATION_IN_MINUTES, MOVIE_TYPE, MOVIE_CATEGORY, DIRECTOR, LEAD_ACTOR_NAME1, LEAD_ACTOR_NAME2, RENTAL_COST) VALUES
('m00001','die hard','1998','english',4,'120','universal','action','john mctiernan','bruce willis','bonnie bedelia',100),
('m00002','the dark knight','2008','english',5,'90','parental guidEnce','action','christopher nolan','christian bale','health ledger',100),
('m00003','the matrix','1999','english',4,'120','universal','action','andy larry','keanu reeves','carrie-anee moss',100),
('m00004','inception','2010','english',5,'120','parental guidEnce','action','christopher nolan','leonardo dicaprio','joseph gordan',100),
('m00005','office space','1999','english',4,'95','universal','comedy','mike judge','ron livingston','jennifer aniston',100),
('m00006','young frankenstein','1974','english',4,'130','universal','comedy','mel brooks','gene wilder','teri garr',100),
('m00007','shaun of the dead','2004','english',4,'95','universal','comedy','edgar wright','simon pegg','kate ashfield',100),
('m00008','casablanca','1942','english',3,'120','universal','romance','michael curtiz','humprey bogart','ingrid bergman',1000),
('m00009','the notebook','2004','english',3,'120','parental guidEnce','romance','nick cassavetes','ryan gosling','rachel mcadams',100),
('m00010','gone with the wind','1939','english',3,'120','parental guidEnce','romance','victor flemming','clark gable','vivien leigh',100),
('m00011','titanic','1997','english',3,'120','parental guidEnce','romance','james cameron','leonardo dicaprio','kate winslet',100);

select * from MOVIES_MASTER;

-- CUSTOMER_ISSUE_DETAILE Table
CREATE TABLE CUSTOMER_ISSUE_DETAILS (
    ISSUE_ID VARCHAR(10) NOT NULL,
    CUSTOMER_ID VARCHAR(10) NOT NULL,
    MOVIE_ID VARCHAR(10),
    ISSUE_DATE DATE NOT NULL,
    RETURN_DATE DATE NOT NULL,
    ACTUAL_DATE_RETURN DATE NOT NULL,
    CONSTRAINT MT_CTS5 PRIMARY KEY (ISSUE_ID),
    CONSTRAINT MT_MEM FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER_MASTER(CUSTOMER_ID),
    CONSTRAINT MT_MEM1 FOREIGN KEY (MOVIE_ID) REFERENCES MOVIES_MASTER(MOVIE_ID)
);

INSERT INTO CUSTOMER_ISSUE_DETAILS (ISSUE_ID, CUSTOMER_ID, MOVIE_ID, ISSUE_DATE, RETURN_DATE, ACTUAL_DATE_RETURN) VALUES
('i00001','c00001','m00001','2012-10-15','2012-10-17','2012-10-17'),
('i00002','c00002','m00002','2012-11-02','2012-11-04','2012-11-05'),
('i00003','c00002','m00002','2012-12-02','2012-12-04','2012-12-03'),
('i00004','c00003','m00003','2012-11-02','2012-11-04','2012-11-10'),
('i00005','c00003','m00004','2012-11-10','2012-11-12','2012-11-12'),
('i00006','c00003','m00005','2012-11-12','2012-11-14','2012-11-14'),
('i00007','c00004','m00006','2012-11-21','2012-11-23','2012-11-24'),
('i00008','c00010','m00008','2013-03-02','2013-03-04','2013-03-05'),
('i00009','c00011','m00010','2013-03-16','2013-03-18','2013-03-18'),
('i00010','c00004','m00007','2012-11-25','2012-11-27','2012-11-27'),
('i00011','c00004','m00007','2012-11-28','2012-11-30','2012-11-30'),
('i00012','c00001','m00001','2013-11-28','2013-11-30','2013-11-30'),
('i00013','c00003','m00001','2012-12-03','2012-12-05','2012-12-05'),
('i00014','c00003','m00010','2013-01-02','2013-01-04','2013-01-05'),
('i00015','c00003','m00011','2013-02-03','2013-02-05','2013-02-06'),
('i00016','c00003','m00011','2013-03-05','2013-03-07','2013-03-07'),
('i00017','c00003','m00008','2013-04-15','2013-04-17','2013-04-17'),
('i00018','c00002','m00010','2015-01-15','2015-01-17','2015-01-17'),
('i00019','c00004','m00001','2012-11-15','2012-11-17','2012-11-17');

select * from CUSTOMER_ISSUE_DETAILS;

-- LIBRARY_CARD_MASTER
CREATE TABLE LIBRARY_CARD_MASTER (
    CARD_ID VARCHAR(10),
    DESCRIPTION VARCHAR(30) NOT NULL,
    AMOUNT BIGINT(50),
    NUMBER_OF_YEARS BIGINT(10) NOT NULL,
    CONSTRAINT MT_CTS2 PRIMARY KEY (CARD_ID)
);

INSERT INTO LIBRARY_CARD_MASTER (CARD_ID, DESCRIPTION, AMOUNT, NUMBER_OF_YEARS) VALUES
('crd001','silver card',1000,1),
('crd002','gold card',2000,2),
('crd003','platinum card',3000,3),
('crd004','diamond card',4000,5);

select * from LIBRARY_CARD_MASTER;

-- CUSTOMER_CARD_DETAILS table
CREATE TABLE CUSTOMER_CARD_DETAILS (
    CUSTOMER_ID VARCHAR(10),
    CARD_ID VARCHAR(10),
    ISSUE_DATE DATE NOT NULL,
    CONSTRAINT MT_CTS3 PRIMARY KEY (CUSTOMER_ID),
    CONSTRAINT MT_CTS41 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER_MASTER(CUSTOMER_ID),
    CONSTRAINT MT_CTS42 FOREIGN KEY (CARD_ID) REFERENCES LIBRARY_CARD_MASTER(CARD_ID)
);

INSERT INTO CUSTOMER_CARD_DETAILS (CUSTOMER_ID, CARD_ID, ISSUE_DATE) VALUES
('c00001','crd001','2012-05-13'),
('c00002','crd002','2012-05-13'),
('c00003','crd002','2013-05-13'),
('c00004','crd003','2013-05-13'),
('c00005','crd003','2012-05-13');

select * from CUSTOMER_CARD_DETAILS;


