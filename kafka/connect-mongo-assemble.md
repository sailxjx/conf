
# Create source connector


```bash
# Create connector
curl -X POST -H "Content-Type: application/json" http://kafka:38093/connectors -d '{
  "name": "mongo-assemble-tasks-source-connector",
  "config": {
    "connector.class": "com.teambition.kafka.connect.mongo.assemble.MongoSourceConnector",
    "tasks.max": 2,
    "batch.size": 100,
    "schema.prefix": "mongo_assemble_",
    "topic.prefix": "mongo_assemble_",
    "handler.names": "com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandler,com.teambition.kafka.connect.mongo.assemble.handlers.WorkTimeHandler",
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin"
  }
}'
```

    {"name":"mongo-assemble-tasks-source-connector","config":{"connector.class":"com.teambition.kafka.connect.mongo.assemble.MongoSourceConnector","tasks.max":"2","batch.size":"100","schema.prefix":"mongo_assemble_","topic.prefix":"mongo_assemble_","handler.names":"com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandler,com.teambition.kafka.connect.mongo.assemble.handlers.WorkTimeHandler","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","name":"mongo-assemble-tasks-source-connector"},"tasks":[{"connector":"mongo-assemble-tasks-source-connector","task":0}]}

# Update source connector


```bash
curl -X PUT -H "Content-Type: application/json" http://kafka:38093/connectors/mongo-assemble-tasks-source-connector/config -d '{
    "connector.class": "com.teambition.kafka.connect.mongo.assemble.MongoSourceConnector",
    "tasks.max": 2,
    "batch.size": 100,
    "schema.prefix": "mongo_assemble_",
    "topic.prefix": "mongo_assemble_",
    "handler.names": "com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandler,com.teambition.kafka.connect.mongo.assemble.handlers.WorkTimeHandler",
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin"
}'
```

    {"error_code":400,"message":"Connector configuration is invalid and contains the following 1 error(s):\nMissing required configuration \"handler.names\" which has no default value.\nYou can also find the above list of errors at the endpoint `/{connectorType}/config/validate`"}

# Remove source controller


```bash
curl -XDELETE http://kafka:38093/connectors/mongo-assemble-tasks-source-connector
```

    
