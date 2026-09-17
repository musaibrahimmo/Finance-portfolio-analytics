import datetime
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
import yfinance as yf

# 1. Define Stock Portfolio and Date Ranges
# Using a diversified mix: Tech (AAPL), Finance (JPM), Retail (WMT), Energy (XOM)
assets = ["AAPL", "JPM", "WMT", "XOM"]
end_date = datetime.date.today()
start_date = end_date - datetime.timedelta(days=3 * 365)  # 3 Years of data

print(f"📥 Fetching historical data for {assets} from {start_date} to {end_date}...")

# 2. Download Adjusted Closing Prices
data = yf.download(assets, start=start_date, end=end_date)["Adj Close"]

# Check for any missing values and clean the data
if data.isnull().values.any():
    print("⚠️ Missing values detected. Applying forward-fill cleaning...")
    data = data.ffill().bfill()

print("\n📊 First 5 rows of cleaned asset prices:")
print(data.head())

# 3. Calculate Financial Risk Metrics: Daily Returns
daily_returns = data.pct_change().dropna()

print("\n📈 First 5 rows of calculated percentage daily returns:")
print(daily_returns.head())

# 4. Calculate Risk Vulnerability: Correlation Matrix
correlation_matrix = daily_returns.corr()
print("\n🔍 Asset Correlation Matrix:")
print(correlation_matrix)

# 5. Technical Indicator: Calculate 50-day and 200-day Moving Averages for AAPL
aapl_trends = pd.DataFrame(data["AAPL"])
aapl_trends["50_Day_SMA"] = aapl_trends["AAPL"].rolling(window=50).mean()
aapl_trends["200_Day_SMA"] = aapl_trends["AAPL"].rolling(window=200).mean()

# =====================================================================
# VISUALIZATIONS (These will save as images to showcase in your portfolio)
# =====================================================================

# Plot 1: Portfolio Correlation Heatmap
plt.figure(figsize=(8, 6))
sns.heatmap(
    correlation_matrix, annot=True, cmap="coolwarm", vmin=-1, vmax=1, fmt=".2f"
)
plt.title("Portfolio Asset Correlation Matrix (Risk Diversification)")
plt.tight_layout()
plt.savefig("portfolio_correlation_heatmap.png")
plt.close()
print("\n💾 Saved: portfolio_correlation_heatmap.png")

# Plot 2: AAPL Moving Average Crossover (Momentum Trend)
plt.figure(figsize=(12, 6))
plt.plot(aapl_trends.index, aapl_trends["AAPL"], label="AAPL Close Price", alpha=0.5)
plt.plot(
    aapl_trends.index,
    aapl_trends["50_Day_SMA"],
    label="50-Day SMA (Short-term)",
    color="orange",
)
plt.plot(
    aapl_trends.index,
    aapl_trends["200_Day_SMA"],
    label="200-Day SMA (Long-term)",
    color="red",
)
plt.title("Apple Inc. (AAPL) Moving Average Crossover Analysis")
plt.xlabel("Date")
plt.ylabel("Price ($)")
plt.legend()
plt.grid(True, linestyle="--", alpha=0.5)
plt.tight_layout()
plt.savefig("aapl_moving_averages.png")
plt.close()
print("💾 Saved: aapl_moving_averages.png")

print("\n🚀 Analytics project execution complete!")
