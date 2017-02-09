PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser --port=7778" spark-shell --master spark://localhost:7077 --executor-memory 1024M --driver-memory 1024M
