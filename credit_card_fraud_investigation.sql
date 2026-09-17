-- =====================================================================
-- PROJECT 2: CREDIT CARD SPEND & FRAUD INVESTIGATION
-- TOOLS USED: PostgreSQL, Window Functions, CTEs, Data Modeling
-- =====================================================================

-- 1. Create Schema Tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    credit_limit DECIMAL(10, 2),
    home_state VARCHAR(2)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    transaction_date TIMESTAMP,
    amount DECIMAL(10, 2),
    merchant_category VARCHAR(50),
    merchant_state VARCHAR(2)
);

-- 2. Insert Realistic Sample Data Mockups
INSERT INTO customers VALUES 
(101, 'John Doe', 5000.00, 'NY'),
(102, 'Jane Smith', 12000.00, 'CA'),
(103, 'Bob Johnson', 3000.00, 'TX');

INSERT INTO transactions VALUES 
(1, 101, '2026-09-01 10:00:00', 45.50, 'Groceries', 'NY'),
(2, 101, '2026-09-05 14:20:00', 1200.00, 'Electronics', 'NY'),
(3, 101, '2026-09-05 14:45:00', 2500.00, 'Online Gaming', 'NV'), -- Flag: Rapid location swap & high spend
(4, 102, '2026-09-02 08:30:00', 15.00, 'Coffee Shop', 'CA'),
(5, 102, '2026-09-15 19:12:00', 85.20, 'Gas Station', 'CA'),
(6, 103, '2026-09-10 11:00:00', 50.00, 'Groceries', 'TX'),
(7, 103, '2026-09-10 11:05:00', 2800.00, 'Luxury Retail', 'FL'); -- Flag: Exceeds typical spend and state change

-- =====================================================================
-- ADVANCED ANALYTICAL QUERIES (Showcasing Core Portfolio Skills)
-- =====================================================================

-- AUDIT QUERY 1: Detecting Out-of-State Velocity (Rapid Location Traversal)
-- Finds transactions occurring outside the customer's home state within short timeframes.
SELECT 
    t.transaction_id,
    c.customer_name,
    c.home_state,
    t.merchant_state,
    t.transaction_date,
    t.amount,
    t.merchant_category
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.merchant_state <> c.home_state
ORDER BY t.transaction_date DESC;


-- AUDIT QUERY 2: Detecting Spikes Above a Customer's Average Spend (Window Function)
-- Flags any transaction that is 300% higher than the customer's average historical purchase size.
WITH customer_averages AS (
    SELECT 
        transaction_id,
        customer_id,
        transaction_date,
        amount,
        merchant_category,
        AVG(amount) OVER(PARTITION BY customer_id) as historical_avg_spend
    FROM transactions
)
SELECT 
    transaction_id,
    customer_id,
    transaction_date,
    amount,
    ROUND(historical_avg_spend, 2) AS average_spend,
    ROUND(amount / historical_avg_spend, 2) AS spike_factor
FROM customer_averages
WHERE amount > (historical_avg_spend * 3.0)
ORDER BY spike_factor DESC;
