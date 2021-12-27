# 年化 sharpe ratio

`(daily_expected_return * 244) / (var ** sqrt(244))` = `daily_expected_return / var * sqrt(244)` = `daily_sharpe ** sqrt(244)`

https://quant.stackexchange.com/questions/2260/how-to-annualize-sharpe-ratio


# 构造 random walk 数据

```
steps = np.random.choice(a=[-1, 0, 1], size=10000)
ticks = steps.cumsum(0)
```

# talib not found

https://stackoverflow.com/questions/45406361/importerror-libta-lib-so-0-cannot-open-shared-object-file-no-such-file-or-dir
```
sudo -s
echo "include /usr/local/lib" >> /etc/ld.so.conf
ldconfig
```
