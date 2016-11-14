

```bash
cd ~/Downloads/kafka_2.11-0.10.0.0
```

    

### Create a topic


```bash
./bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```

    Created topic "test".



```bash
./bin/kafka-topics --list --zookeeper localhost:2181
```

    __samza_coordinator_wikipedia-feed_1
    __samza_coordinator_wikipedia-parser_1
    __samza_coordinator_wikipedia-stats_1
    test


### Send some messages


```bash
./bin/kafka-console-producer --broker-list 192.168.0.124:39092 --topic test
```

    

### Listen to a topic


```bash
# Listen to a topic `from beginning`
./bin/kafka-console-consumer  --zookeeper 192.168.0.124:32181 --topic wikipedia-raw --from-beginning

# >= 3.1.0
./bin/kafka-console-consumer --bootstrap-server 192.168.0.124:39092 --topic test --from-beginning
```

### Delete a topic


```bash
./bin/kafka-topics --delete --zookeeper localhost:2181 --topic try-test
```

# kafka rest


```bash
# Get topics
curl -XGET http://192.168.0.124:38082/topics
```

    ["__consumer_offsets","_schemas","mongo_local_test_users","test"]


```bash

```
