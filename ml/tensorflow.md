# 选择可见的设备号

https://stackoverflow.com/questions/40069883/how-to-set-specific-gpu-in-tensorflow
CUDA_VISIBLE_DEVICES=0

```
import tensorflow as tf
with tf.device('/gpu:1'):
  ...
```

# 各版本 tensorflow 与 cuda/cudnn 版本对照

https://www.tensorflow.org/install/source#gpu

# 修复 tensorflow 2.4 在 cuda 11 上报错的问题 Could not load dynamic library 'libcusolver.so.10

https://github.com/tensorflow/tensorflow/issues/43947

`ln -s /usr/local/cuda-11.1/targets/x86_64-linux/lib/libcusolver.so.11 $(python -c "import tensorflow.python as x; print(x.__path__[0])")/libcusolver.so.10`

# 检查 gpu 是否可用

`tf.test.is_gpu_available()`
`tf.test.gpu_device_name()`
