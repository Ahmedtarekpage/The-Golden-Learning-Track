

# PostgresSQL
![alt text](https://i.ibb.co/L8pKkbH/Postgres-SQL.png)

Let's look at what makes Structured Query Language (SQL) and the databases that use SQL so well-liked before we start writing SQL queries.

Saying that SQL is a language, in my opinion, is a crucial distinction. The last word in SQL is hence language. Beyond the databases we'll use in this lecture, SQL is utilised everywhere. This being the case, SQL is most well-known for its ability to interface with databases. For the sake of this course, imagine a database as a collection of Excel spreadsheets gathered in one location. Although not all databases consist of numerous Excel spreadsheets gathered in one location, this is a plausible assumption for this class.

## Installation

 - [PGAdmin](https://www.postgresql.org/download/s)

## Database 
A database is an organized collection of structured information, or data, typically stored electronically in a computer system. A database is usually controlled by a database management system (DBMS).  

## Entity Relationship Diagrams

![alt text](https://drawio-app.com/wp-content/uploads/2016/08/erd.gif)

An entity relationship diagram (ERD) is a common way to view data in a database. Below is the ERD for the database we will use from Parch & Posey. These diagrams help you visualize the data you are analyzing including:

- The names of the tables.
- The columns in each table.
- The way the tables work together.

## SQL vs. NoSQL
 - [Check this Article](https://www.talend.com/resources/sql-vs-nosql/)

## A few key points about data stored in SQL databases:


- #### Data in databases is stored in tables that can be thought of just like Excel spreadsheets. For the most part, you can think of a database as a bunch of Excel spreadsheets. Each spreadsheet has rows and columns. Where each row holds data on a transaction, a person, a company, etc., while each column holds data pertaining to a particular aspect of one of the rows you care about like a name, location, a unique id, etc.  


- #### All the data in the same column must match in terms of data type.  An entire column is considered quantitative, discrete, or as some sort of string. This means if you have one row with a string in a particular column, the entire column might change to a text data type. This can be very bad if you want to do math with this column!


- #### Consistent column types are one of the main reasons working with databases is fast. Often databases hold a LOT of data. So, knowing that the columns are all of the same type of data means that obtaining data from a database can still be fast.  


# Lets start writing SQL Code 
![alt text](https://i.ibb.co/BrbBmnH/carbon.png)  




The key to SQL is understanding statements. A few statements include:

- CREATE TABLE → is a statement that creates a new table in a database.  

- DROP TABLE → is a statement that removes a table in a database.
# SQL Basics
### SELECT, WHERE,ORDER BY, LIMIT
- **The SELECT statement →** is used to select data from a database. The data returned is stored in a result table, called the result-set.   

- **LIMIT →**  to select a limited number of records

- **ORDER BY →** used to sort the result-set in ascending or descending order. The ORDER BY keyword sorts the records in ascending order by default.  

- **WHERE →** WHERE clause is used to filter records. It is used to extract only those records that fulfill a specified condition.  

### Code Example

selecting column from table
``` sql
  SELECT column1, column2, total, names
  FROM table 
  WHERE total < 500 AND  total > 50
  WHERE names == 'ahmed'
  WHERE name IN ('Walmart', 'Target', 'Nordstrom');
  WHERE name LIKE 'C%';   
  WHERE name NOT LIKE '%one%';  
  WHERE name LIKE '%s';
  ORDER BY column2 DESC
  LIMIT 15;
```
## Arithmetic Operators
``` sql
SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

```

# JOINS
![alt text](https://i.ibb.co/3TDKW8T/SQL-Joins-svg.png)
 - [Check this Article](https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/)
### Code Example :-
``` sql
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;
```

## Primary Key V.s Foriegn Key 
![alt text](https://i.ibb.co/9qcq0NL/Difference-Between-Primary-Key-and-Foreign-Key-thumbnail.webp)
### Look at the below Image and take Care of Arrow's Shape 
![alt text](https://i.ibb.co/CJdG5Mc/Data-model-feat.png)

## Alias 
SQL aliases are used to give a table, or a column in a table, a temporary name
``` sql
SELECT r.name region, a.name account, 
           o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

```

# Aggregation
An aggregate function in SQL performs a calculation on multiple values and returns a single value  
SELECT SUM(poster_qty) AS total_poster_sales
FROM orders;
### Sum
``` sql
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;

```
### MIN, MAX
``` sql
SELECT MAX(occurred_at)
FROM web_events;

```
### AVG
``` sql
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
              AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
              AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;


```

### Group By 
![alt text](https://i.ibb.co/dQhrRQQ/GROUP-BY-avg.jpg)
 - [Check this Article](https://www.programiz.com/sql/group-by)
 
 #### Example
``` sql
SELECT a.name, MIN(total_amt_usd) smallest_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order;


```

``` sql
SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;



```
### DISTINCT
The SQL DISTINCT keyword is used in conjunction with the SELECT statement to eliminate all the duplicate records and fetching only unique records.

There may be a situation when you have multiple duplicate records in a table. While fetching such records, it makes more sense to fetch only those unique records instead of fetching duplicate records.
 - [Check this Article](https://www.tutorialspoint.com/sql/sql-distinct-keyword.htm)

# Subqueries Temporary Tables
Both subqueries and table expressions are methods for being able to write a query that creates a table, and then write a query that interacts with this new one  
### Example 1
``` sql
SELECT AVG(standard_qty) avg_std, AVG(gloss_qty) avg_gls, AVG(poster_qty) avg_pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);

SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
      (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);


``` 
### Example 2
``` sql
SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM(SELECT region_name, MAX(total_amt) total_amt
        FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
                FROM sales_reps s
                JOIN accounts a
                ON a.sales_rep_id = s.id
                JOIN orders o
                ON o.account_id = a.id
                JOIN region r
                ON r.id = s.region_id
                GROUP BY 1, 2) t1
        GROUP BY 1) t2
JOIN (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
        FROM sales_reps s
        JOIN accounts a
        ON a.sales_rep_id = s.id
        JOIN orders o
        ON o.account_id = a.id
        JOIN region r
        ON r.id = s.region_id
        GROUP BY 1,2
        ORDER BY 3 DESC) t3
ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt;


``` 

### Example 3
- [Having is the same as WHERE but with AGGREGATION]


``` sql
SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
         SELECT MAX(total_amt)
         FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
                 FROM sales_reps s
                 JOIN accounts a
                 ON a.sales_rep_id = s.id
                 JOIN orders o
                 ON o.account_id = a.id
                 JOIN region r
                 ON r.id = s.region_id
                 GROUP BY r.name) sub);


``` 

### WITH
``` sql
WITH t1 AS (
     SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
      FROM sales_reps s
      JOIN accounts a
      ON a.sales_rep_id = s.id
      JOIN orders o
      ON o.account_id = a.id
      JOIN region r
      ON r.id = s.region_id
      GROUP BY 1,2
      ORDER BY 3 DESC), 
t2 AS (
      SELECT region_name, MAX(total_amt) total_amt
      FROM t1
      GROUP BY 1)
SELECT t1.rep_name, t1.region_name, t1.total_amt
FROM t1
JOIN t2
ON t1.region_name = t2.region_name AND t1.total_amt = t2.total_amt;



``` 
# Data Cleaning 
### LEFT & RIGHT Solutions
### Example 1
``` sql
SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;


``` 
### Example 2
``` sql
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name, 
   RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;




``` 
### POSITION, STRPOS, & SUBSTR Solutions
``` sql
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;

``` 

### CONCAT
``` sql
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;
``` 

### COALESCE
The COALESCE function returns the first non-NULL value from a series of expressions. The expressions are evaluated in the order in which they are specified, and the result of the function is the first value that is not null. The result of the COALESCE function returns NULL only if all the arguments are null.

``` sql
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;
``` 

# Window Function 
In SQL, window functions operate on a set of rows called a window frame. They return a single value for each row from the underlying query.
### What is the differance between Window Func & Aggregation

 - [Check this Article](https://learnsql.com/blog/window-functions-vs-aggregate-functions/)
#### Example 
``` sql
SELECT standard_amt_usd,
       SUM(standard_amt_usd) OVER (ORDER BY occurred_at) AS running_total
FROM orders
``` 

### RANK()
the RANK() function as it adds the number of repeated rows to the repeated rank to calculate the rank of the next row. 
 - [Check this Article](https://www.geeksforgeeks.org/rank-function-in-sql-server/)
 #### Example
 ``` sql
SELECT id,
       account_id,
       total,
       RANK() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders
``` 
### Aliases for Multiple Window Functions
 ``` sql
SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER account_year_window AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders 
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at))

``` 
### Comparing a Row to a Previous Row
 ``` sql
SELECT occurred_at,
       total_amt_usd,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) AS lead,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) - total_amt_usd AS lead_difference
FROM (
SELECT occurred_at,
       SUM(total_amt_usd) AS total_amt_usd
  FROM orders 
 GROUP BY 1
) sub

``` 
### NTILE()
 it Divide rows into n groups

  - [Check this Article](https://www.geeksforgeeks.org/ntile-function-in-sql-server/)

# Thanks For Reading 
 #### Thanks for Reading that and Remember it's only a Summary  
 #### that you can use for Revision or for following it as a RoadMap

 ## 🚀 About Me
[![MIT License](https://img.shields.io/badge/LinkedIn-Ahmedtarekpage-blue)](https://www.linkedin.com/in/ahmedtarekpage)

I am Ahmed Tarek a Computer Software Engineer 💻 worked with a technical manager at (Waymo, Google) , found a bug on a unicorn Company, and had online courses with the biggest platform in the middle east(ALmentor.NET). I also came in first place in the robotics world cup, robocup.

I have 5 years of experience as aSOftware Engineer and Tuto I can help you as a Python developer, data analyst, and robotics engineer. I have five years of experience and have assisted businesses in making 10,000 $ per month, depending on the analytics used.

![Thanks](https://i.ibb.co/DbXkKy5/Thanks-For-Reading-BY-Ahmed-Tarek.jpg)

