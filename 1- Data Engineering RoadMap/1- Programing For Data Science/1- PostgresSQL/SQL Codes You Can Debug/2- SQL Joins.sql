--joins & ON
--Try pulling all the data from the accounts table, and all the data from the orders table.
SELECT *
    FROM orders
JOIN accounts
    ON orders.account_id = accounts.id;

--Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
    FROM orders
JOIN accounts
    ON orders.account_id = accounts.id
-----------------------------------------------------------------------------------------
--JOIN More than table 
SELECT *
    FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id
-----------------------------------------------------------------------------------------------

-- JOIN Questions 
--Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
SELECT a.name, a.primary_poc, w.occurred_at, w.channel
    FROM accounts a 
JOIN web_events w 
    ON a.id = w.account_id
WHERE a.name = 'Walmart'

--Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name, s.name, a.name
    FROM region r
JOIN sales_reps s 
    ON r.id = s.region_id
JOIN accounts a 
    ON s.id = a.sales_rep_id 
ORDER BY a.name

--Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT r.name, a.name, o.total_amt_usd/(o.total + 0.01) unit_price
    FROM region r 
JOIN sales_reps s 
    ON r.id = s.region_id
JOIN accounts a 
    ON s.id =a.sales_rep_id
JOIN orders o 
    ON a.id = o.account_id

-----------------------------------------------------------------------------------------
--Final Questions Joins
SELECT r.names, s.name, a.name
    FROM region r 
JOIN sales_reps s 
    ON r.id = s.id 
JOIN accounts a 
    ON s.id = a.sales_rep_id
WHERE r.name = 'Midwest'
ORDER BY a.name;


