# 随机漫步

seaborn 官网有一个很有趣的例子，随机生成 500 条记录，每个值是之前所有值累加再加上当前的随机值（类似于随机漫步里面抛硬币的例子），最后绘出的图形像极了实际交易的走势

```
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="darkgrid")

df = pd.DataFrame(dict(time=np.arange(500),
                       value=np.random.randn(500).cumsum()))
g = sns.relplot(x="time", y="value", kind="line", data=df)
g.fig.autofmt_xdate()
```