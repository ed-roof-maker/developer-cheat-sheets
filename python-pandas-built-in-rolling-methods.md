# Python Cheat Sheet
Commonly used python patterns

## Pandas Built In Rolling Methods
```
x=60
pd.rolling(x).count() # Number of non-NA observations
pd.rolling(x).sum() # Sum of values
pd.rolling(x).mean() # Mean of values
pd.rolling(x).mad() # Mean absolute deviation
pd.rolling(x).median() # Arithmetic median of values
pd.rolling(x).min() # Minimum
pd.rolling(x).max() # Maximum
pd.rolling(x).mode() # Mode
pd.rolling(x).abs() # Absolute Value
pd.rolling(x).prod() # Product of values
pd.rolling(x).std() # Bessel-corrected sample standard deviation
pd.rolling(x).var() # Unbiased variance
pd.rolling(x).sem() # Standard error of the mean
pd.rolling(x).skew() # Sample skewness (3rd moment)
pd.rolling(x).kurt() # Sample kurtosis (4th moment)
pd.rolling(x).quantile() # Sample quantile (value at %)
pd.rolling(x).cumsum() # Cumulative sum
pd.rolling(x).cumprod() # Cumulative product
pd.rolling(x).cummax() # Cumulative maximum
pd.rolling(x).cummin() # Cumulative minimum

```
