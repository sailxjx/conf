reshape

`x_axis = np.linspace(x.min(),x.max(),50)`

# Append column to empty array

  ```
X = np.empty((10, 0))
for i in range(5):
    X = np.append(X, np.ones((10, 1)) * i, axis=1)
```

# Count values of each group

`np.unique(x, return_counts=True)`

# Sort argmax, top-N argmax

```
arr = np.array([1, 3, 2, 4, 5])
print(arr.argsort()[-3:])  # top-3 argmin
print(arr.argsort()[-3:][::-1])  # top-3 argmax
```

# 按特定分布规律生成随机数
https://docs.scipy.org/doc/numpy/reference/routines.random.html

# 处理异常数据
masked array
https://stackoverflow.com/questions/21752989/numpy-efficiently-avoid-0s-when-taking-logmatrix

# 为连续数据分桶 bins

```
cut_bins = np.flip(-np.logspace(0.1, 3, 10, dtype=int))
print(cut_bins)
pd.Series(np.digitize(df_train_featured.created_delta, right=True, bins=cut_bins)).value_counts()
```

# 使用 numpy 切分滑动窗口

https://stackoverflow.com/questions/6811183/rolling-window-for-1d-arrays-in-numpy

```
def rolling_window(a, window_size):
    shape = (a.shape[0] - window_size + 1, window_size) + a.shape[1:]
    strides = (a.strides[0],) + a.strides
    return np.lib.stride_tricks.as_strided(a, shape=shape, strides=strides)
```

# 使向量内每个元素相乘

`np.prod(arr)`
