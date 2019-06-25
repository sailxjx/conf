# 协方差与相关系数

https://www.zhihu.com/question/20852004

计算两个变量的变化值（用两个向量表示）的差异
cov(x, y) = E[(X-μx)(Y-μy)]
每时每刻 X 与均值之差乘以 Y 与均值之差，求和并计算期望

方差为协方差的特例，即 var(x) = cov(x, x)

皮尔森相关系数 η 
为 x, y 协方差除以两者的标准差乘积
cor(x, y) = cov(x, y) / (std(x) * std(y))

```julia
using Statistics

x = [1,2,3]
y = [1,3,5]

cov(x, y)  
# 2.0

cor(x, y)
# 1.0
```
