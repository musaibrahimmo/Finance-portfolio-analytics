# 📈 Finance Data Analytics Portfolio

Welcome to my portfolio! This repository highlights data-driven solutions for corporate finance, asset risk management, and predictive modeling using Python, SQL, Power BI, and Excel.

---

### 📊 Project 1: Portfolio Risk & Equity Returns Analytics
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
