- =====================================================================
-- PROJECT 3: CLOUD DATA WAREHOUSING & ETL PIPELINE AUTOMATION
-- PLATFORM TARGET: Snowflake Cloud Data Platform
-- SKILLS: Cloud Architecture, Compute Management, Bulk Data Ingestion
-- =====================================================================

-- 1. Configure High-Performance Cloud Compute Resources
-- Setting up an auto-suspending virtual warehouse to optimize cloud compute costs
CREATE OR REPLACE WAREHOUSE finance_analytics_wh
    WITH WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 300 -- Automatically shuts down after 5 mins of inactivity to save money
    AUTO_RESUME = TRUE
    COMMENT = 'Dedicated compute warehouse for corporate financial analysis reporting';

-- 2. Create Dedicated Database & Schema Layers
CREATE OR REPLACE DATABASE financial_reporting_db;
CREATE OR REPLACE SCHEMA production_tables;

USE DATABASE financial_reporting_db;
USE SCHEMA production_tables;

-- 3. Construct the Production Target Analytics Table
CREATE OR REPLACE TABLE raw_transaction_ledger (
    transaction_id VARCHAR(50),
    account_id VARCHAR(50),
    timestamp TIMESTAMP_NTZ,
    transaction_amount DECIMAL(18, 4),
    merchant_name VARCHAR(100),
    store_category VARCHAR(50),
    ingestion_time TIMESTAMP_DEFAULT CURRENT_TIMESTAMP() -- Audit tracking metric
);

-- 4. Create an External Stage Pointing to a Cloud Data Lake Container
-- Simulates securely linking Snowflake directly to an enterprise AWS S3 bucket source
CREATE OR REPLACE STAGE aws_s3_finance_datalake
    URL = 's3://enterprise-financial-datalake-bucket/raw-transactions/'
    COMMENT = 'Staging area linking incoming bulk transaction CSV drops from AWS S3';

-- 5. Execute Optimized Bulk Data Ingestion Pipeline (ETL)
-- Utilizes Snowflake's high-speed COPY INTO engine to load millions of rows instantly
COPY INTO raw_transaction_ledger
FROM @aws_s3_finance_datalake
FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE
)
ON_ERROR = 'CONTINUE'; -- Gracefully handles data rows containing format anomalies without breaking pipeline

-- 6. Performance Query: Build an Aggregated Summary Table for BI Dashboards
SELECT 
    store_category,
    COUNT(transaction_id) as total_volume,
    ROUND(SUM(transaction_amount), 2) as aggregate_spend
FROM raw_transaction_ledger
GROUP BY store_category
ORDER BY aggregate_spend DESC;
