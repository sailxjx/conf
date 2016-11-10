
# Start connectors


```bash
# Start schema registry via docker
docker run --name cp-schema-registry -p 8081:28081 \
    -e SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL=zookeeper:42181/defaultconfig \
    -e SCHEMA_REGISTRY_HOST_NAME=schema-registry \
    -e SCHEMA_REGISTRY_LISTENERS=http://192.168.0.124:48081 \
    -d confluentinc/cp-schema-registry
```


```bash
# Standalone mongo-source-connector
CLASSPATH=./connect-mongo-1.0-SNAPSHOT/* ./bin/connect-standalone \
     ./etc/connect-json-standalone.properties ./etc/connect-mongo-source.properties
```


```bash
# connect-mongo-source.properties
```
name=mongo-source-connector
connector.class=org.apache.kafka.connect.mongo.MongoSourceConnector
tasks.max=1
host=127.0.0.1
port=27017
batch.size=100
schema.name=mongoschema
topic.prefix=mongo
```
```


```bash
# Distributed mongo-source-connector
./bin/connect-distributed etc/kafka/connect-distributed.properties
```

# Rest APIS


```bash
# Get connectors
curl http://localhost:8083/connectors
```

    ["mongo-source-local-test"]


```bash
# Create connector
curl -X POST -H "Content-Type: application/json" http://localhost:8083/connectors -d '{
  "name": "mongo-source-local-test",
  "config": {
    "connector.class": "org.apache.kafka.connect.mongo.MongoSourceConnector",
    "tasks.max": 1,
    "host": "127.0.0.1",
    "port": 27017,
    "batch.size": 100,
    "schema.name": "mongoschema",
    "topic.prefix": "mongo",
    "databases":"test.users"
  }
}'
```

    {"error_code":409,"message":"Connector mongo-source-local-test already exists"}


```bash
# Update connector
curl -X PUT -H "Content-Type: application/json" http://localhost:8083/connectors/mongo-source-local-test/config -d '{
    "connector.class": "org.apache.kafka.connect.mongo.MongoSourceConnector",
    "tasks.max": 1,
    "host": "127.0.0.1",
    "port": 27017,
    "batch.size": 100,
    "schema.name": "mongoschema",
    "topic.prefix": "mongo",
    "databases":"test.users"
}'
```

    {"name":"mongo-source-local-test","config":{"connector.class":"org.apache.kafka.connect.mongo.MongoSourceConnector","tasks.max":"1","host":"127.0.0.1","port":"27017","batch.size":"100","schema.name":"mongoschema","topic.prefix":"mongo","databases":"test.users","name":"mongo-source-local-test"},"tasks":[]}
