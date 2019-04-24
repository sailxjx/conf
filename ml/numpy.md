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
