Select * from transactions;

-- 1  Analyze fraud occurrences and their percentage across different transaction types.  
-- Provides actionable insights to identify high-risk transaction types for targeted fraud prevention strategies.

SELECT 
    type,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount,
    ROUND(AVG(amount), 2) AS avg_transaction_amount
FROM transactions
GROUP BY type
ORDER BY total_transactions DESC;

-- 2 Analyze the fraud distribution across transaction types.  
-- Provides key metrics such as fraud count, total transactions, and fraud percentage to identify high-risk transaction categories.

SELECT 
    type,
    COUNT(CASE WHEN isFraud = 1 THEN 1 END) AS fraud_count,
    COUNT(*) AS total_transactions,
    ROUND((COUNT(CASE WHEN isFraud = 1 THEN 1 END) * 100.0 / COUNT(*)), 2) AS fraud_percentage
FROM transactions
GROUP BY type
ORDER BY fraud_percentage DESC;

-- 3 Identify customers involved in multiple fraudulent transactions.  
-- Highlights top offenders by fraud count and total fraudulent amount to prioritize investigation and prevention.

SELECT 
    nameOrig AS customer_id,
    COUNT(*) AS fraud_count,
    SUM(amount) AS total_fraud_amount
FROM transactions
WHERE isFraud = 1
GROUP BY nameOrig
HAVING COUNT(*) > 1
ORDER BY fraud_count DESC, total_fraud_amount DESC;

-- 4 Identify top 10 fraud-prone destinations by total fraudulent transaction amount.  
-- Helps uncover high-risk accounts or entities involved in substantial fraud activities.

SELECT 
    nameDest AS destination_id,
    COUNT(*) AS fraud_count,
    SUM(amount) AS total_fraud_amount
FROM transactions
WHERE isFraud = 1
GROUP BY nameDest
ORDER BY total_fraud_amount DESC
LIMIT 10;

-- 5 Detect transactions with discrepancies between original and updated balances after a transaction.
-- Helps identify potential errors, fraudulent activities, or issues in transaction processing.

SELECT 
    step,
    type,
    amount,
    oldbalanceOrg,
    newbalanceOrig,
    (oldbalanceOrg - newbalanceOrig - amount) AS balance_discrepancy
FROM transactions
WHERE (oldbalanceOrg - newbalanceOrig - amount) != 0;

-- 6 Identify transactions with unusually high amounts that are significantly above the average.
-- This can help highlight potential outliers, large-scale fraud, or high-risk transactions.

SELECT 
    step,
    type,
    amount,
    nameOrig,
    nameDest
FROM transactions
WHERE amount > (SELECT AVG(amount) * 5 FROM transactions);

-- 7 Analyze the percentage of fraudulent transactions at each step of the transaction process.
-- This helps identify which steps in the transaction lifecycle are most susceptible to fraud.


SELECT 
    step,
    COUNT(CASE WHEN isFraud = 1 THEN 1 END) AS fraud_count,
    ROUND((COUNT(CASE WHEN isFraud = 1 THEN 1 END) * 100 / COUNT(*)), 2) AS fraud_percentage
FROM transactions
GROUP BY step
ORDER BY step;

-- 8 Calculate the total amount involved in fraudulent and non-fraudulent transactions separately.
-- This provides a clear view of the financial impact of fraud compared to legitimate transactions.


SELECT 
    SUM(CASE WHEN isFraud = 1 THEN amount ELSE 0 END) AS total_fraud_amount,
    SUM(CASE WHEN isFraud = 0 THEN amount ELSE 0 END) AS total_nonfraud_amount
FROM transactions;

-- 9 Analyze the effectiveness of the fraud detection system by calculating the percentage of flagged transactions that are actually fraudulent.
-- This helps to evaluate how well the fraud detection system is identifying true fraud cases.


SELECT 
    COUNT(*) AS flagged_transactions,
    COUNT(CASE WHEN isFraud = 1 THEN 1 END) AS actual_fraud_cases,
    ROUND((COUNT(CASE WHEN isFraud = 1 THEN 1 END) * 100.0 / COUNT(*)), 2) AS effectiveness_percentage
FROM transactions
WHERE isFlaggedFraud = 1;

-- 10 Analyze customer transaction patterns by grouping transactions based on customer and type, providing insights into the total, average, and frequency of transactions.
-- This helps identify high-value customers and transaction types, improving fraud detection and customer segmentation.


SELECT 
    nameOrig AS customer_id,
    type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_amount
FROM transactions
GROUP BY nameOrig, type
ORDER BY total_amount DESC;

-- 11 Classify transactions into 'Small', 'Medium', and 'Large' based on amount and analyze the fraud rate for each transaction size.
-- This enables targeted fraud detection strategies based on transaction size, identifying high-risk transaction categories.


SELECT 
    CASE 
        WHEN amount < 100 THEN 'Small'
        WHEN amount BETWEEN 100 AND 1000 THEN 'Medium'
        ELSE 'Large'
    END AS transaction_size,
    COUNT(*) AS total_transactions,
    COUNT(CASE WHEN isFraud = 1 THEN 1 END) AS fraud_count,
    ROUND((COUNT(CASE WHEN isFraud = 1 THEN 1 END) * 100 / COUNT(*)), 2) AS fraud_rate
FROM transactions
GROUP BY transaction_size
ORDER BY fraud_rate DESC;




