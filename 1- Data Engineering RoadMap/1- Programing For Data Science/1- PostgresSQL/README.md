
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

## SELECT, WHERE,ORDER BY, LIMIT
- **The SELECT statement →** is used to select data from a database. The data returned is stored in a result table, called the result-set.   

- **LIMIT →**  to select a limited number of records

- **ORDER BY →** used to sort the result-set in ascending or descending order. The ORDER BY keyword sorts the records in ascending order by default.  

- **WHERE →** he WHERE clause is used to filter records. It is used to extract only those records that fulfill a specified condition.  

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

 
    


