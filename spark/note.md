# Quick start in standalone mode
1. start master `start-master.sh`
2. start worker `start-worker.sh spark://localhost:7077 -c 4'
3. start spark shell `spark-shell --master spark://localhost:7077 --total-executor-cores 1`
4. coding
