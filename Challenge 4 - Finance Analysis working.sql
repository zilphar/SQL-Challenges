-- to view all the tables fir the finance analysis you can review here 
SELECT * FROM accounts;

SELECT * FROM branches;

SELECT * FROM customers;

SELECT * FROM transactions;

-- 1. What are the names of all the customers who live in New York?
SELECT FirstName, LastName, City
FROM customers
WHERE City = "New York";

-- 2. What is the total number of accounts in the Accounts table?
SELECT COUNT(AccountID) AS no_of_accounts
FROM accounts; 

-- 3. What is the total balance of all checking accounts?
SELECT DISTINCT AccountType, SUM(Balance) AS total_balance
FROM accounts
WHERE AccountType = "Checking";

-- 4. What is the total balance of all accounts associated with customers who live in Los Angeles?
SELECT DISTINCT City, SUM(Balance) AS total_balance
FROM accounts 
	LEFT JOIN customers
    ON accounts.CustomerID = customers. CustomerID
WHERE City = "los Angeles";

-- 5. Which branch has the highest average account balance?
SELECT BranchName, AVG(Balance) AS average_account_balance
FROM branches
	RIGHT JOIN accounts
    ON branches.BranchID = accounts.BranchID
GROUP BY BranchName
ORDER BY average_account_balance DESC
LIMIT 1; 

-- 6. Which customer has the highest current balance in their accounts?
SELECT customers.CustomerID, FirstName,  LastName, SUM(Balance) AS current_balance
FROM customers
	RIGHT jOIN accounts 
    ON customers.CustomerID = accounts.CustomerID
GROUP BY customers.CustomerID, FirstName, LastName
ORDER BY current_balance DESC
LIMIT 1; 

-- 7. Which customer has made the most transactions in the Transactions table?
SELECT customers.CustomerID, FirstName, LastName, COUNT(TransactionID) AS no_of_transactions
FROM transactions 
	INNER JOIN accounts 
    ON transactions.AccountID = accounts.AccountID
    INNER JOIN customers 
    ON accounts.CustomerID = customers.CustomerID
GROUP BY customers.CustomerID, FirstName, LastName
ORDER BY no_of_transactions DESC; 

-- 8.Which branch has the highest total balance across all of its accounts?
SELECT branches.BranchID, BranchName, SUM(Balance) AS total_balance
FROM branches
	RIGHT JOIN accounts
    ON branches.BranchID = accounts.BranchID
GROUP BY branches.BranchID, BranchName
ORDER BY total_balance DESC
LIMIT 1; 

-- 9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
SELECT FirstName, LastName, AccountType, SUM(Balance) AS total_balance
FROM customers
	RIGHT JOIN accounts
    ON customers.CustomerID = accounts.CustomerID     
GROUP BY FirstName, LastName, AccountType
ORDER BY FirstName DESC, total_balance DESC
limit 4; 

-- 10. Which branch has the highest number of transactions in the Transactions table?
SELECT branches.BranchID, BranchName, COUNT(TransactionID) AS no_of_transactions
FROM branches
	INNER JOIN accounts
	ON branches.BranchID = accounts.BranchID
    INNER JOIN transactions
    ON accounts.AccountID = transactions.AccountID
GROUP BY BranchID, BranchName
ORDER BY no_of_transactions DESC; 

