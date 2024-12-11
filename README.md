# Fraud Detection Using SQL
![Visualization of a fraud detection system with transaction monitoring](path/to/image)
## Project Overview
This project focuses on identifying and analyzing fraudulent financial transactions using SQL. The dataset includes over 1 million transactions and explores patterns, trends, and anomalies to detect fraudulent activity. Through advanced SQL queries, we derive actionable insights, ensuring the analysis is scalable and relevant across various industries.

---

## Key Features
- **Domain:** Financial Fraud Detection
- **Tools Used:** MySQL Workbench, Python (for preprocessing)
- **Dataset Size:** 1 million+ transactions
- **Core Objectives:**
  - Detect fraudulent transactions.
  - Analyze transaction patterns across user groups.
  - Identify high-risk accounts and transactions.
  - Provide actionable insights to prevent future fraud.

---

## Dataset Description
The dataset consists of 11 key columns:
------------------------------------------------------------------------------------------
| Column Name      | Data Type | Description                                             |
|------------------|-----------|---------------------------------------------------------|
| `step`           | INT       | Time step in hours                                      |
| `type`           | VARCHAR   | Type of transaction (e.g., CASH_OUT, PAYMENT)           |
| `amount`         | FLOAT     | Transaction amount                                      |
| `nameOrig`       | VARCHAR   | Identifier for originating account                      |
| `oldbalanceOrg`  | FLOAT     | Starting balance of originating account                 |
| `newbalanceOrig` | FLOAT     | Ending balance of originating account                   |
| `nameDest`       | VARCHAR   | Identifier for destination account                      |
| `oldbalanceDest` | FLOAT     | Starting balance of destination account                 |
| `newbalanceDest` | FLOAT     | Ending balance of destination account                   |
| `isFraud`        | BOOLEAN   | Indicates whether a transaction is fraudulent           |
| `isFlaggedFraud` | BOOLEAN   | Indicates suspicious transactions flagged by the system |
------------------------------------------------------------------------------------------
**Note:** Due to size limitations, the full dataset is hosted externally. A sample dataset is included in this repository for demonstration purposes.

---

## Key Insights
### 1. Fraud Detection
- Identified **20% fraudulent transactions** in the `CASH_OUT` and `TRANSFER` transaction types.
- Found patterns where account balances drop significantly post-transaction in fraudulent cases.

### 2. High-Risk Accounts
- Flagged **top 5% accounts** with repeated fraudulent activities.
- Detected high-risk accounts with significant discrepancies in balance updates.

### 3. Transaction Trends
- **92% of flagged transactions** involve account types `CASH_OUT` and `TRANSFER`.
- Accounts with minimal balance changes were less likely to be fraudulent.

---

## How to Use This Repository
1. Clone this repository:
   ```bash
   git clone https://github.com/Rajibdas10/Fraud-Analytics-Detection/blob/main/Fraud%20Analytics%20and%20Detection.sql
   ```
2. Import the SQL scripts into your prefered database system.
3. Use the dataset, and download it [here](https://www.kaggle.com/datasets/ealaxi/paysim1).
---

## Challenges Addressed
- Managing large datasets efficiently.
- Identifying nuanced fraud patterns across millions of transactions.
- Ensuring queries are optimized for quick results.

---

## Future Enhancements
- Automate fraud detection using machine learning.
- Integrate real-time fraud alerts.
- Expand analysis to include regional trends and time-based patterns.

---

## Contact
For inquiries, reach out:
- **Email:** rajibdas10.10.1999@gmail.com
- **LinkedIn:** [https://www.linkedin.com/in/rajib-das-4a6063215](https://www.linkedin.com/in/rajib-das-4a6063215/)

