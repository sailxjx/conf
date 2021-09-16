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
