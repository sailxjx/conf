reshape

`x_axis = np.linspace(x.min(),x.max(),50)`

# Append column to empty array

  ```
X = np.empty((10, 0))
for i in range(5):
    X = np.append(X, np.ones((10, 1)) * i, axis=1)
```
