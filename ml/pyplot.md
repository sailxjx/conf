# bar chart

```
task_cnts = df_tasks.s_startdate.value_counts()
plt.bar(task_cnts.index, task_cnts.values)
plt.show()
```

# 绘制模拟曲线

```
from scipy.interpolate import interp1d
xnew = np.linspace(x.min(),x.max(),50)
x = storypoints.index
y = storypoints.values
f = interp1d(x, y, kind='cubic')
plt.plot(x, y, 'o', xnew, f(xnew), '-')

plt.show()
```

# 设置 y 轴线范围

the range must be set after the plot.
```
plt.plot(xdata, ydata)
plt.ylim(ymin=0)  # this line
```
