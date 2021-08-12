# mse / rmse / rmspe 容易混淆的三种 loss

mse: `np.mean(np.square(y-yp))`
rmse: `np.sqrt(np.mean(np.square(y-yp)))`
rmspe: `np.sqrt(np.mean(np.square((y-yp)/y)))`
