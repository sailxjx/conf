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


# 不同的 y 轴比例

Plots with different scales
https://matplotlib.org/stable/gallery/subplots_axes_and_figures/two_scales.html

```
close = df['Close']
fig, ax1 = plt.subplots(figsize=(15, 6))
ax1.plot(close, color='r', lw=2.)
ax1.plot(close, '^', markersize=10, color='m', label = 'buying signal', markevery = states_buy)
ax1.plot(close, 'v', markersize=10, color='k', label = 'selling signal', markevery = states_sell)
plt.legend()

ax2 = ax1.twinx()  # 复制 x 轴
long = df[df["Close"]>=df["Open"]]
short = df[df["Close"]<df["Open"]]
ax2.bar(long.index, long["Volume"], color="g", label="long")
ax2.bar(short.index, short["Volume"], color="r", label="short")
ax2.set_ylim(1e6, 1e7)  # 设置不同的 y 轴范围

plt.title('total gains %f, total investment %f%%'%(total_gains, invest))
plt.legend()
plt.show()
```

# 显示中文

https://stackoverflow.com/questions/39630928/how-to-plot-a-figure-with-chinese-characters-in-label

```
from matplotlib import font_manager

fontP = font_manager.FontProperties()
fontP.set_family('SimHei')
fontP.set_size(10)

plt.legend(loc=0, prop=fontP)
```

# 多个图表

https://matplotlib.org/devdocs/gallery/subplots_axes_and_figures/subplots_demo.html
```
fig, (ax1, ax2) = plt.subplots(1, 2)
fig.suptitle('Horizontally stacked subplots')
ax1.plot(x, y)
ax2.plot(x, -y)
```

# 修改背景色

plt.rcParams['figure.facecolor'] = "#F3F3F3"

# 3d 图像

```
from mpl_toolkits import mplot3d

fig = plt.figure(figsize=(10, 10))
ax = plt.axes(projection='3d')

x = np.arange(-2, 2, 0.001)  # 偏离 value 范围
coef = np.tanh(x)  # 系数
y = mu = np.random.uniform(-1, 1, x.shape[0])  # 趋势收益率
z = mu * (1 - coef) * (mu > 0) + mu * (1 + coef) * (mu < 0)  # 实际收益率

ax.scatter3D(x, y, z, c=z, cmap='Blues')
```
