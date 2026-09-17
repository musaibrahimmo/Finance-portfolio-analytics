# 📈 Finance Data Analytics Portfolio

Welcome to my portfolio! This repository highlights data-driven solutions for corporate finance, asset risk management, and predictive modeling using Python, SQL, Cloud Data Warehousing, Power BI, and Excel.

---

### 📊 Project 1: Portfolio Risk & rns Analytics
*Tools Used:* Python (pandas, yfinance, matplotlib, seaborn)
*   *File:* [portfolio_analytics.py](./portfolio_analytics.py)

*   *Business Problem:* An investor wants to understand the historical risk, volatility, and moving average crossovers of a multi-asset stock portfolio to optimize rebalancing strategies.
*   *Data Source:* Programmatic data extraction via the Yahoo Finance API (yfinance) covering 3 years of daily adjusted closing prices.
*   *What I Built:* 
    *   Programmed an automated pipeline to extract historical prices for key market sectors (Tech, Finance, Retail, Energy).
    *   Engineered rolling 50-day and 200-day Simple Moving Averages (SMA) to identify momentum trends and breakout signals.
    *   Generated a correlation matrix heatmap to evaluate cross-asset diversification risks.
---

### 🔎 Project 2: Credit Card Spend & Transaction Fraud Investigation
*Tools Used:* SQL (PostgreSQL), Relational Database Design
*   *File:* [credit_card_fraud_investigation.sql](./credit_card_fraud_investigation.sql)

*   *Business Problem:* A regional bank's risk compliance team needs to identify unusual spending spikes and out-of-state transaction anomalies across consumer accounts.
*   *Data Source:* Mock relational database containing structured customer profile and transaction tables.
*   *What I Built:*
    *   Constructed a relational schema with proper primary and foreign key constraints to track credit usage profiles.
    *   Wrote analytical queries using *Common Table Expressions (CTEs)* and *Window Functions* (PARTITION BY) to flag transactions that exceeded a user's average historical spend size by 300%.
    *   Isolated potential geographic fraud vectors by identifying transaction locations differing from documented account home states.

---

### ❄️ Project 3: Cloud Data Warehousing & ETL Pipeline Automation
*Tools Used:* Snowflake (or Google BigQuery), Python, SQL, Cloud Storage (AWS S3 / GCS)

*   *Business Problem:* A financial services firm is struggling with slow report loading speeds because their transaction datasets have scaled past 10 million rows, overloading traditional local servers.
*   *What I Built:*
    *   Designed and configured a centralized *Cloud Data Warehouse* schema using a dimensional modeling approach optimized for rapid analytic querying.
    *   Constructed scalable staging layers to ingest bulk historical transaction data directly from cloud storage buckets into data warehouse tables.
    *   Implemented query optimization structures including cluster keys and materialized views to handle high-volume processing.
*   *Business Impact:* Migrated on-premise operational logging data to a high-concurrency cloud warehouse, reducing corporate dashboard update rendering times from 4 minutes down to less than 12 seconds.*
--


### 📊 Project 4: Retail Banking Loan Portfolio Dashboard
*Tools Used:* Microsoft Power BI, DAX, Star Schema Data Modeling
*   *Dataset Focus:* 50,000 corporate and retail loan application records tracking interest rates, debt-to-income (DTI) metrics, and repayment delinquencies.

*   *Business Problem:* Risk executives lack an automated, centralized platform to monitor real-time loan portfolio concentrations, geographic risk exposures, and non-performing loans (NPL).
*   *What I Built:*
    *   Designed a robust *Star Schema Data Model* linking a centralized Loan Fact table to distinct Date, Customer, and Geography dimension tables.
    *   Wrote complex *DAX Measures* to calculate dynamic financial Key Performance Indicators (KPIs):
        *   Total Active Exposure = SUM(Loans[Remaining_Principal])
        *   Non-Performing Loan (NPL) Rate = DIVIDE(CALCULATE(SUM(Loans[Principal]), Loans[Status] = "Default"), SUM(Loans[Principal]), 0)
    *   Built high-impact executive views displaying monthly default migrations using dynamic charts, filters, and KPI cards.

---

### 🗒️ Project 5: Corporate Expense Allocation & Budget Variance Tracker
*Tools Used:* Microsoft Excel, Power Query, Advanced Pivot Tables & Formulas

*   *Business Problem:* A corporate finance department manually spends 8 hours every month matching corporate credit card statements to departmental cost centers and calculating budget overruns.
*   *What I Built:*
    *   Constructed an automated ETL pipeline using *Power Query* to merge 12 separate monthly transaction CSV sheets, strip duplicate metadata, and clean unformatted text fields automatically.
    *   Built a dynamic variance summary matrix using multi-dimensional *Pivot Tables* to map actual expenditures directly against allocated departmental budgets.
    *   Implemented conditional formatting logic using muted corporate color scales to highlight variance alerts where actual spending exceeded forecasts by more than 5%.
*   *Business Impact:* Re-engineered an operational reporting workflow, reducing monthly data compilation time from 8 hours down to a single-click data refresh.*
