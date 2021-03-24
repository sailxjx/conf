# Ordinary Least Squares

https://www.quora.com/What-is-the-difference-between-linear-regression-and-least-squares 

For now*, we can think of linear regression as the task of fitting a straight line (or, in the case of multiple linear regression, a "hyperplane") through a set of points. But there are many possible strategies to fit a line through a set of points:
you could draw a line, and then for each of the data points, measure the vertical distance between the point and the line, square it, and add these up; the fitted line would be the one where this sum of distances is as small as possible

最小二乘法，计算所有点到路径的垂直距离(y-axis)，并加和它们的平方，所得最小值的路径就是最拟合路径
