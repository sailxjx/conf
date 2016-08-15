

```bash
cd ~/Downloads/kafka_2.11-0.10.0.0
```

    

### Create a topic


```bash
./bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```

    Created topic "test".



```bash
./bin/kafka-topics.sh --list --zookeeper localhost:2181
```

    __samza_coordinator_wikipedia-feed_1
    __samza_coordinator_wikipedia-parser_1
    __samza_coordinator_wikipedia-stats_1
    test


### Send some messages


```bash
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
```

    

### Listen to a topic


```bash
# Listen to a topic `from beginning`
./bin/kafka-console-consumer.sh  --zookeeper localhost:2181 --topic wikipedia-raw --from-beginning
```

### Delete a topic


```bash
./bin/kafka-topics --delete --zookeeper localhost:2181 --topic try-test
```
