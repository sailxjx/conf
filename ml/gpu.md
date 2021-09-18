# Check tensorflow gpu

```
import tensorflow as tf
tf.test.gpu_device_name()
```

```
from tensorflow.python.client import device_lib
print(device_lib.list_local_devices())
```

# Check gpu usage

`nvidia-smi`
