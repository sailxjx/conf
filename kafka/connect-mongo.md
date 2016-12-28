
# How to distribute mongo connector


```bash
cd ~/coding/opensource/confluent-3.1.0
```

    


```bash
./bin/kafka-topics --zookeeper kafka:32181 --list
```

    __consumer_offsets
    _schemas
    avrotest
    binarytest
    connect-configs
    connect-offsets
    connect-status
    jsontest
    mongo_21_teambition_users
    mongo_21_test_users


# Get connect offsets


```bash
# Get topics
curl http://kafka:38082/topics
```

    ["__consumer_offsets","_schemas","avrotest","binarytest","connect-configs","connect-offsets","connect-status","jsontest","mongo_21_teambition_users"]


```bash
# Get one topic
curl -XGET -H "Content-Type: application/vnd.kafka.v1+json" \
    http://kafka:38082/topics/mongo_21_test_users/partitions/0
```

    {"partition":0,"leader":1,"replicas":[{"broker":1,"leader":true,"in_sync":true}]}


```bash
# Create consumer
curl -X POST -H "Content-Type: application/vnd.kafka.v1+json" \
      --data '{"name": "connect_offsets_consumer", "format": "json", "auto.offset.reset": "smallest"}' \
      http://kafka:38082/consumers/connect_offsets_consumer
```

    {"instance_id":"connect_offsets_consumer","base_uri":"http://192.168.0.21:8082/consumers/connect_offsets_consumer/instances/connect_offsets_consumer"}


```bash
# Get topic messages
curl -X GET -H "Accept: application/vnd.kafka.json.v1+json" \
    http://kafka:38082/consumers/connect_offsets_consumer/instances/connect_offsets_consumer/topics/mongo_21_test_users
```

    {"error_code":405,"message":"HTTP 405 Method Not Allowed"}


```bash
curl -XGET http://kafka:38082/consumers/connect-offsets_consumer/instances/connect_offsets_consumer/
```


```bash
# Delete consumer
curl -XDELETE http://kafka:38082/consumers/connect_offsets_consumer/instances/connect_offsets_consumer
```

    

# Add mongo connector


```bash
# Create connector
curl -X POST -H "Content-Type: application/json" http://kafka:38084/connectors -d '{
  "name": "mongo-source-21-test-users",
  "config": {
    "connector.class": "org.apache.kafka.connect.mongo.MongoSourceConnector",
    "tasks.max": 1,
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin",
    "batch.size": 100,
    "schema.name": "mongo_21_schema",
    "topic.prefix": "mongo_21",
    "databases":"test.users"
  }
}'
```

    {"name":"mongo-source-21-test-users","config":{"connector.class":"org.apache.kafka.connect.mongo.MongoSourceConnector","tasks.max":"1","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","batch.size":"100","schema.name":"mongo_21_schema","topic.prefix":"mongo_21","databases":"test.users","name":"mongo-source-21-test-users"},"tasks":[]}


```bash
# Get connectors
curl http://localhost:8083/connectors
```

    []


```bash
# Delete connectors
curl -XDELETE http://localhost:8084/connectors/mongo-source-21-test-users
```

    
