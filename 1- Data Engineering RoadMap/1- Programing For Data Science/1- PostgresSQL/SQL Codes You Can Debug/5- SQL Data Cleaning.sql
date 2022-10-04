-- LEFT & RIGHT
-- We are Using it For Cleaning Data 
SELECT first_name,
       last_name,
       phone_number,
       LEFT(phone_number,3) AS area_code,
       RIGHT(phone_number,8) AS phone_num_only,
       RIGHT(phone_number,LENGTH(phone_number)-4)
    FROM customer_data 

----------------------------------------------------------------------
--In the accounts table, there is a column holding the website for each company. 
--The last three digits specify what type of web address they are using. 
--A list of extensions (and pricing) is provided here. Pull these extensions and provide how many of each website type exist in the accounts table.
SELECT RIGHT(website,3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1,
ORDER By 2 DESC;

--There is much debate about how much the name (or even the first letter of a company name) matters.
-- Use the accounts table to pull the first letter of each company name to see the distribution of company names that begin with each letter (or number).
SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;



--Use the accounts table and a CASE statement to create two groups: 
--one group of company names that start with a number and a second group of those company names that start with a letter. 
--What proportion of company names start with a letter?
SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                          THEN 1 ELSE 0 END AS num, 
            CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                          THEN 0 ELSE 1 END AS letter
         FROM accounts) t1;

--Consider vowels as a, e, i, o, and u. What proportion of company names start with a vowel, and what percent start with anything else?
SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                           THEN 1 ELSE 0 END AS vowels, 
             CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                          THEN 0 ELSE 1 END AS other
            FROM accounts) t1;
-------------------------------------------------------------------

--POSITION, STRPOS & SUBSTR 
SELECT first_name,
       last_name,
       city_state,
       POSITION(',' IN city_state) AS comma_position,
       STRPOS(city_state,',') AS substr_comma_position
       LOWER(city_state) AS lower_case
       UPPER(city_state) AS uppercase,
       LEFT(city_state,POSITION(',' IN city_state)) AS city
    FROM customer_data
-----------------------------------------------------------------
--Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name, 
   RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;



