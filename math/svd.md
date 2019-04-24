# SVD

<https://blog.csdn.net/u012162613/article/details/42214205>

任意矩阵可分解为三个矩阵 `A = U x sigma x VT`

## A 和三个矩阵的维度

A(m x n)
U(m x m)
sigma(n x n)
VT(n x n)

## 减少三个矩阵的维度

sigma 为正数对角矩阵，多数元素为 0，对角元素就是「奇异值」，按由大到小排列，如果仅取前 r 个元素，可将三个矩阵的维度压缩为

U(m x r)
sigma(r x r)
VT(r x n)

## numpy 代码

```python
import numpy as np
A = np.mat([[2,2],[1,1]])
U, sigma, VT = np.linalg.svd(A)
U, sigma, VT
```

## 求解 SVD

-   <https://www.youtube.com/watch?v=cOUTpqlX-Xs>
-   <https://www.youtube.com/watch?v=4g-zS32oKEw>

A.T x A = V x sigmaT x sigma x VT
A x V = U x sigma

1.  利用矩阵行列式等于 0 计算特征值(eigenvalues)  `det(AT x A - lambda x I) = 0` (公式里面的 lambda)。 [行列式]<https://www.mathsisfun.com/algebra/matrix-determinant.html>

```python
A = np.mat([
  [5,5],
  [-1,7]
])

A.T.dot(A)
# [
#   [26 - la, 18],
#   [18, 74 - la]
# ] = 0
# la^2 - 100*la + 1600 = 0
# (la - 20) * (la - 80) = 0

# la = [20, 80]
```

2.  通过 A.T x A - la x I 计算得出 V, sigma (实在解释不清楚，见上面第一个视频)
3.  通过 A x V = U x sigma 得出 U

## 相关概念

1.  正交矩阵(U) 矩阵行与列完全正交，与转置矩阵的点积(dot)为单位矩阵(I) <https://zh.wikipedia.org/wiki/%E6%AD%A3%E4%BA%A4%E7%9F%A9%E9%98%B5>
2.  对角矩阵(sigma) 除了对角线其余均为 0 <https://zh.wikipedia.org/wiki/%E5%B0%8D%E8%A7%92%E7%9F%A9%E9%99%A3>
