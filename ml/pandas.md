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

# 计算特征相似度

`df.corr()`

# Describe objects

`df.describe(include=[np.object])`

# 转换行/列 (pivot)

pivot: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.pivot.html
unstack: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.unstack.html#pandas.DataFrame.unstack

# 根据时间分组（group by time period）

https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Grouper.html

`user_visits.groupby(pd.Grouper(key='add_time', freq='1d')).first()`

# 并行计算 groupby, apply

https://stackoverflow.com/questions/26187759/parallelize-apply-after-pandas-groupby

```
    retLst = Parallel(n_jobs=multiprocessing.cpu_count())(delayed(func)(group) for name, group in dfGrouped)
```

# 并行计算 apply

```
from joblib import Parallel, delayed
import multiprocessing

def parallelize(df, func):
    partitions = multiprocessing.cpu_count()
    df_splited = np.array_split(df, partitions)
    df_splited = Parallel(
        n_jobs=partitions
    )(delayed(func)(df) for df in df_splited)
    return pd.concat(df_splited)

df_feature_extracted = parallelize(df_featured, lambda df: df.apply(extract_base_feature, axis=1))
```

# 避免 windows 回车符号

https://stackoverflow.com/questions/34550120/pandas-escape-carriage-return-in-to-csv
`df = pd.read_csv('./data/task_content.csv.gz', lineterminator='\n')`
