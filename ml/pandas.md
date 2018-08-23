# unique count series

`series.value_counts()`

# find by index

`df_positions.iloc[259]`

# revert series of True/False

`~df_companies_test.isin(list(df_companies_processed['text']))`

# reset_index

重置 index 为序号标记,
同样可以将 series 转为 dataframe
https://stackoverflow.com/questions/20110170/turn-pandas-multi-index-into-column

# pivot_table

将行内值 group 后转为列
https://pandas.pydata.org/pandas-docs/stable/generated/pandas.pivot_table.html

# count(distinct field)

`executor_cnts = df_tasks.groupby('_sprintid')._executorid.nunique()`

# 使用原始值替换 na， fillna with the values from source

https://stackoverflow.com/questions/45106195/pandas-rolling-mean-dont-change-numbers-to-nan-in-dataframe

```
df.rolling(center=False, window=5).mean().fillna(df)
```

# Panel to multiindex dataframe

`panel.to_frame()`

# Get rows from multiindex dataframe

https://stackoverflow.com/questions/18835077/selecting-from-multi-index-pandas
