# yfinance
## Arguments of `yf.download()`
- `tickers`
	- Ticker(s) to download
	- str or list of str
	- `yf.download(tickers="AAPL")`
- `start` and `end`
	- Start/end dates for ticker `df`
	- str of datetime
	- `start="2024-01-01", end="2024-12-31"`
- `period`
	- Defines how far back to fetch data
	- str
	- valid values: `"1d"`, `"5d"`, ..., `"5y"`, `"ytd"`, `"max"`
	- `period="1y"`
- `interval`
	- The data frequency per row
	- str
	- Similar syntax to `period`
- `group_by`
	- How to group output columns when multiple tickers
	- str
	- valid values: `column`, `ticker`, etc
- `auto_adjust`
	- If `True`, adjusts OHLC for dividends and splits (no separate `Adj Close` column)
	- bool
- `actions`
	- If `True`, include stock dividends and stock splits in output
	- bool
- `rounding`
	- If `True`, round to 2 decimal places
	- bool
- `ignore_tz`
	- Ignores timezone differences when combining tickers
	- bool
- `show_errors`
	- If `False`, suppress printing of error messages during download
	- bool
- `timeout`
	- Max time (in seconds) to wait on a network response before timing out
	- float or none


## Learned
- Syntax such as `alpha`, `col`, etc for design
- Syntax such as i`nplace = True`, `rename.columns()` etc for data manipulation
- Separate files, shown below
- Patch artist
## Issues
- Column order not consistent - caused plotting issues
- DataFrame naming system can be improved - `df` prefix, not suffix
- One file
	- Restarting kernel -> all cells had to run in specific order
	- Forgetting to run earlier cell -> issue
	- Big reliance on memory and cell history
	- Same files -> less easily iterable
- Issues arose with order of cell execution
	- E.g., columns were added to `pct_returns_daily_df` in later cell
		- When `pct_returns_daily_df` was replotted, it included the added columns from a later cell
	- Improper procedure followed - missed rolling volatility columns in data transformation (returns section)
	- **Plan data pipeline before plotting**


![[Screenshot 2025-10-19 at 19.43.45.png]]![[Screenshot 2025-10-19 at 19.45.03.png]]![[Screenshot 2025-10-19 at 19.45.09.png]]