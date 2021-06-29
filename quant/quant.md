# 年化 sharpe ratio

`(daily_expected_return * 244) / (var ** sqrt(244))` = `daily_expected_return / var * sqrt(244)` = `daily_sharpe ** sqrt(244)`

https://quant.stackexchange.com/questions/2260/how-to-annualize-sharpe-ratio


# 构造 random walk 数据

```
steps = np.random.choice(a=[-1, 0, 1], size=10000)
ticks = steps.cumsum(0)
```
