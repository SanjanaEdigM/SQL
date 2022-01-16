CREATE DATABASE movies;

USE movies;

CREATE TABLE movies_details(
   id INT PRIMARY KEY,
   name VARCHAR(25) UNIQUE,
   year YEAR,
   language VARCHAR(25) NOT NULL,
   directors VARCHAR(25),
   platform VARCHAR(25) DEFAULT 'Theatre',
   budget DOUBLE,
   collections DOUBLE,
   ratings FLOAT CHECK(ratings>8 AND ratings<10)
);

DESC movies_details;

INSERT INTO movies_details(id,name,year,language,directors,budget,collections,ratings) VALUE(1,'GGVV',2021,'Kannada','Raj B Shetty',10000000,900000,9.5);

INSERT INTO movies_details(id,name,year,language,directors,budget,collections,ratings) VALUE(2,'ASN',2019,'Kannada','Sachin',7000000,600000,8.1);

INSERT INTO movies_details(id,name,year,language,directors,platform,budget,collections,ratings) VALUE(3,'Yuvaratna',2020,'Kannada','Santhosh','OTT',100000000,10000000,9.1);

INSERT INTO movies_details (id,name,year,language,directors,budget,collections,ratings) VALUE(4,'HarryPotter',2010,'English','FGH',6000000,8000000,8.1),
(5,'Pushpa',2021,'Telugu','yffru',6000000,200000,8.1),
(6,'Dvitva',2022,'Kannada','Pavan',9000000,900000,9.1),
(7,'RP',2021,'Kannada','Rohit',6000000,500000,8.5),
(8,'Appu',2010,'Kannada','gfty',5000000,600000,9.8),
(9,'KGF',2018,'Hindi','PrashanthNeil',200000000,100000000,8.1),
(10,'A',1998,'Kannada','Upendra',2000000,3000000,8.5),
(11,'RajKumara',2017,'Kannada','Santhosh',2000000,3000000,9.5);


SELECT * FROM movies_details;

SELECT *FROM movies_details WHERE ratings>8;

SELECT *FROM movies_details WHERE Platform='OTT' AND ratings>9;

SELECT *FROM movies_details WHERE Platform='OTT' OR Platform='Theatre' AND ratings>8;

SELECT *FROM movies_details WHERE directors='Raj B Shetty' OR directors='Santhosh' OR directors='ROHIT';

SELECT *FROM movies_details WHERE directors IN('Raj B Shetty','Santhosh','Rohit','Sanjana');

SELECT *FROM movies_details WHERE year>2000 AND year<=2021;

SELECT NAME,directors FROM movies_details;

SELECT DISTINCT directors,year FROM movies_details;

SELECT *FROM movies_details ORDER BY year;

SELECT *FROM movies_details ORDER BY ratings DESC;

INSERT INTO movies_details (id,name,year,language,budget,collections,ratings) VALUE (12,'RAM',2012,'Kannada',2000000,3000000,9.5);

UPDATE movies_details SET directors='fgf' WHERE id=12;

DELETE FROM movies_details WHERE name='pushpa';

SELECT *FROM movies_details;

SELECT *FROM movies_details WHERE directors IS NULL;

SELECT *FROM movies_details WHERE directors IS NOT NULL;

ALTER TABLE movies_details MODIFY COLUMN Platform VARCHAR(20) NOT NULL;

-- deleting the data in table

TRUNCATE TABLE movies_details1;

-- deleting the table only
DROP TABLE movies_details1;

-- deleting the database
DROP DATABASE web_series;


-- LIMIT is a keyword which fetch the data from the top
SELECT *FROM movies_details LIMIT 5; -- fetch 5 data from the table

SELECT *FROM movies_details ORDER BY id DESC LIMIT 5;

-- LIKE IS A OPERATOR TO FIND THE PATTERN MATCHING 

-- WILD CARD OPERATORS ARE:
--  1. %-zero or more charactors search with the single word data 
--  2._ -only one single chararter


SELECT *FROM movies_details WHERE name LIKE '%P'; -- this searches for the word which comes first

SELECT *FROM movies_details WHERE name LIKE 'GG%'; -- this searches for the word which comes last

SELECT *FROM movies_details WHERE Name LIKE '%ratna%'; -- this search for the complete word that contains ratna

SELECT *FROM movies_details WHERE directors LIKE '%San%';

SELECT *FROM MOVIES_DETAILS WHERE directors LIKE '_r%'; -- to get the complete word with letter r

SELECT *FROM movies_details WHERE name LIKE 'A_p%'; -- to get the middle letter

SELECT *FROM movies_details WHERE name LIKE '__v%';

-- ALIAS is another name given for the attributes using AS keyword
SELECT  name AS movie_name FROM movies_details;
SELECT directors AS directors_name FROM movies_details;
SELECT collections AS Total_collections FROM movies_details; -- only chamges to that particularly for that query

SELECT *FROM  movies_details;

SELECT M.name, M.directors FROM movies_details M;

-- AGGREGATE FUNCTIONS:IS USE TO DO THE MATHEMATICAL CALCULATION
-- 1. MAX(COLUMN NAME)- GIVES MAXIMUM VALUE IN THAT COLUMN
-- 2. MIN(COLUMN NAME)- Give minimum value from the given colum
-- 3. AVG() -  Give average value of the column
-- 4. SUM()
-- 5. COUNT()

SELECT MAX(Collections) AS Heighest_movie_collection FROM movies_details;

SELECT MAX(budget) AS Heightest_movie_budget FROM movies_details;

SELECT MIN(Collections) AS Min_movie_collection FROM movies_details;

SELECT MIN(budget) AS Max_movie_budget FROM movies_details;

SELECT AVG(budget) AS AVG_movie_budget FROM movies_details;

SELECT SUM(Collections) AS sum_movie_buget FROM movies_details;

SELECT COUNT(name) AS num_of_movie FROM Movies_details;

SELECT COUNT(*) AS num_of_movies FROM movies_details;

SELECT COUNT(DISTINCT directors) AS movies_by_unique_directors FROM movies_details;

SELECT COUNT(DISTINCT language) AS movies_by_unique_language FROM movies_details;

-- Date and Time Function
-- 1. CURDATE():
-- 2. CURTIME():
-- 3. NOW():
-- 4. DATE():
-- 5.Time():

SELECT curtime() AS Present_date; 

SELECT NOW() AS Present_dayandtime;

INSERT INTO movies_details VALUE(now());
ALTER TABLE movies_details ADD COLUMN released_date_time DATETIME;

DESC movies_details;

INSERT INTO movies_details(id,name,language,platform,released_date_time) VALUE(13,'Badava Rascal','Kannada','Theatre','2021-12-24 11:00:00');

SELECT *FROM movies_details;

INSERT INTO movies_details(id,name,language,platform,released_date_time) VALUE(14,'Spider Man','English','Theatre',now());

SELECT name , released_date_time FROM movies_details WHERE id=14;

SELECT name,time(released_date_time) AS release_time FROM movies_details WHERE id=13;

SELECT name,MONTHNAME(released_date_time) AS month_name FROM movies_details WHERE id=13;

SELECT name,YEAR(released_date_time) AS year FROM movies_details WHERE id=13;

SELECT name,dayname(released_date_time) AS day_name FROM movies_details WHERE id=13;

SELECT name,hour(released_date_time) AS hour FROM movies_details WHERE id=13;

SELECT name,min(released_date_time) AS minute FROM movies_details WHERE id=13;

SELECT name,second(released_date_time) AS second FROM movies_details WHERE id=13;

-- No of movies in particular movie
select COUNT(name) As No_movies_relesed from movies_details where year =2021;

-- GROUP BY : group the similar type of data and organise the data based on column 
-- we can use ORDER BY with the GROUP BY
-- Will use group by always with the select
-- we can use WHERE clause before GROUP BY
-- HAVING it is used to give the condition on already grouped data
-- It can be used to give the condition on aggregate function

-- No of movies done by each year,by directors,languagess
SELECT COUNT(name) AS No_of_movies_in_each_year,year from movies_details GROUP BY year;

SELECT COUNT(name) As No_of_movies_by_director, directors from movies_details GROUP BY directors;

SELECT COUNT(name) As No_of_movies_by_language, language from movies_details GROUP BY language;



-- No of movies available in each platform
SELECT COUNT(name) AS No_of_movies_by_platform , platform from movies_details GROUP BY platform;

-- No of movies done in each month
SELECT COUNT(name) As No_of_movies_by_month, MONTHNAME(released_date_time) As released_month FROM  movies_Details GROUP BY released_month;

-- No of movies by year and director

SELECT COUNT(name) As No_of_movies_by_year_and_director, year,directors From movies_details  GROUP BY year,directors;

SELECT MAX(collections) As Highest_Collection_By_year,year from movies_details GROUP BY year ORDER BY Highest_collection_by_year DESC;

SELECT MAX(year) As Highest_collection_in_year,collections from movies_details GROUP BY YEAR ORDER BY Highest_collection_in_year DESC; 

-- highest ratings in each platform order by rating asending
SELECT MAX(ratings) As Highest_ratings_By_platform , platform from movies_details GROUP BY platform ORDER BY Highest_ratings_by_platform asc;

-- Lowest  collection done in each year
SELECT MIN(collections) As Highest_Collection_By_year,year from movies_details GROUP BY year ORDER BY Highest_collection_by_year ;

-- lowest budget by each director
SELECT MIN(budget) As Lowest_Budget_By_directors , directors from movies_details GROUP BY directors ORDER BY Lowest_Budget_By_directors;

-- the total collection done in each platform
SELECT SUM(collections) As Total_Collection_By_Platform, platform From movies_details GROUP BY platform ORDER BY total_Collection_by_platform DESC;

-- Average collection by each year
SELECT AVG(Collections) As Average_Collection_By_Year, year FROM movies_details GROUP BY year ORDER BY Average_Collection_By_Year;

-- Average collection by selected directors
SELECT AVG(Collections) As Average_Collection_By_directors, directors from movies_details WHERE directors in('Santhosh','Rohith','Sachin')GROUP BY directors;

-- Average collection by each directors having collection greater than 50cr
SELECT AVG(collections) As Average_Collections_By_Directors, directors from movies_details GROUP BY directors HAVING Average_COllections_By_Directors>500000;

-- Total collection by each directors having total lesser 100cr
SELECT SUM(collections) As Total_COllection_By_Directors,directors from movies_Details GROUP BY directors HAVING total_collection_by_directors<5000000;


-- diff between WHERE and HAVING*************************************

-- WHERE used in filter the data on individual row 
-- HAVING used to apply the filter on the grouped data

-- WHERE is used before GROUP BY
-- HAVING is used after GROUP BY

-- WHERE is called as a pre-filter
-- HAVING is called as a post-filter

-- WHERE cannot be used with the aggregate function
-- HAVING can be used with the aggregate function

-- WHERE can apply filter with the row operation
-- HAVING can apply filter with the column operation

-- ORDER OF KEYWORDS***************************************

-- 1. SELECT
-- 2. FROM
-- 3. WHERE
-- 4. GROUP BY
-- 5. HAVING
-- 6. ORDER BY
-- 7. LIMIT


-- subqueries (nested queries)
-- *written using parenthesis
-- *always subqueries will be executed first
-- *we can have any num of inner or subquery
-- we can get only one column in subquery

SELECT*from movies_details WHERE collections=(SELECT MAX(collections) FROM movies_details);

-- second highest collections
SELECT MAX(collections)from movies_details WHERE collections<(SELECT MAX(collections) FROM movies_details);

-- get the details of the movie which as second highest collections
SELECT*from movies_details WHERE collections=(SELECT MAX(collections)from movies_details WHERE collections<(SELECT MAX(collections) FROM movies_details));

SELECT MAX(collections)from movies_details WHERE collections<(SELECT MAX(collections)from movies_details WHERE collections<(SELECT MAX(collections) FROM movies_details));

SELECT*from movies_details WHERE collections=(SELECT MAX(collections)from movies_details WHERE collections<(SELECT MAX(collections)from movies_details WHERE collections<(SELECT MAX(collections) FROM movies_details)));

SELECT *FROM movies_details WHERE language='Kannada';
-- getting second highest collection in kannada movie

SELECT MAX(collections)FROM movies_details WHERE COLLECTIONS<(SELECT MAX(collections)FROM movies_details WHERE LANGUAGE='KANNADA')AND LANGUAGE ='KANNADA';

SELECT*from movies_details WHERE collections=(SELECT MAX(collections)FROM movies_details WHERE COLLECTIONS<(SELECT MAX(collections)FROM movies_details WHERE LANGUAGE='KANNADA')AND LANGUAGE ='KANNADA');

-- to get min collections in movies details
SELECT MIN(Collections)FROM movies_details;

SELECT MIN(collections)FROM movies_details WHERE collections>(SELECT MIN(collections)FROM movies_details);

-- to get both highest and lowest collection of the movies

SELECT *FROM movies_details WHERE collections IN ((SELECT MAX(collections)FROM movies_details),(SELECT MIN(Collections)FROM movies_details));

 SELECT MAX(collections) ,directors FROM movies_details GROUP BY directors;
 
 SELECT *FROM movies_details WHERE collections IN (SELECT MAX(collections)FROM movies_details) GROUP BY directors;
 
 -- get the movies details has the highest collections by each director having greater than 10cr
 
 SELECT *FROM movies_details WHERE collections IN (SELECT MAX(collections)FROM movies_details) GROUP BY directors HAVING MAX(collections)>5000000;
 
 -- we can use subquery with DML(INSET UPDATE DELETE) AND DQL(SELECT)
 
 CREATE TABLE movies_details_DUPLICATE(
   id INT PRIMARY KEY,
   name VARCHAR(25) UNIQUE,
   year YEAR,
   language VARCHAR(25) NOT NULL,
   directors VARCHAR(25),
   platform VARCHAR(25) DEFAULT 'Theatre',
   budget DOUBLE,
   collections DOUBLE,
   ratings FLOAT CHECK(ratings>8 AND ratings<10)
);

SELECT *FROM movies_details_DUPLICATE;


 
 -- transaction property
 -- 4 properties
 -- ACID properties
 -- A- Atomocity - either do all or nothing
 -- C- sum should be same before and after transaction
 -- I- Isolation-convert parallek transaction into the serial transaction
 -- D-Durability - it store all transaction permanently in database
 

 
 
 


