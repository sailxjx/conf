
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
    "handler.names": "com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandler,com.teambition.kafka.connect.mongo.assemble.handlers.WorkTimeHandler,com.teambition.kafka.connect.mongo.assemble.handlers.TaskCustomFieldHandler",
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin"
  }
}'
```

    {"error_code":500,"message":"Error writing connector configuration to Kafka"}

# Update source connector


```bash
curl -X PUT -H "Content-Type: application/json" http://kafka-connect-mongo-assemble.dev22/connectors/mongo-assemble-tasks-source-connector/config -d '{
    "connector.class": "com.teambition.kafka.connect.mongo.assemble.MongoSourceConnector",
    "tasks.max": 2,
    "batch.size": 100,
    "schema.prefix": "mongo_assemble_",
    "topic.prefix": "mongo_assemble_",
    "handler.names": "com.teambition.kafka.connect.mongo.assemble.handlers.ActivityHandler,com.teambition.kafka.connect.mongo.assemble.handlers.EventHandler,com.teambition.kafka.connect.mongo.assemble.handlers.PostHandler,com.teambition.kafka.connect.mongo.assemble.handlers.TaskCustomFieldHandler,com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandler,com.teambition.kafka.connect.mongo.assemble.handlers.WorkHandler,com.teambition.kafka.connect.mongo.assemble.handlers.SprintHandler,com.teambition.kafka.connect.mongo.assemble.handlers.WorkTimeHandler,com.teambition.kafka.connect.mongo.assemble.handlers.ScenarioFieldConfigHandler",
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin"
}'
```

    {"name":"mongo-assemble-tasks-source-connector","config":{"connector.class":"com.teambition.kafka.connect.mongo.assemble.MongoSourceConnector","tasks.max":"2","batch.size":"100","schema.prefix":"mongo_assemble_","topic.prefix":"mongo_assemble_","handler.names":"com.teambition.kafka.connect.mongo.assemble.handlers.ActivityHandler,com.teambition.kafka.connect.mongo.assemble.handlers.EventHandler,com.teambition.kafka.connect.mongo.assemble.handlers.PostHandler,com.teambition.kafka.connect.mongo.assemble.handlers.TaskCustomFieldHandler,com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandler,com.teambition.kafka.connect.mongo.assemble.handlers.WorkHandler,com.teambition.kafka.connect.mongo.assemble.handlers.SprintHandler,com.teambition.kafka.connect.mongo.assemble.handlers.WorkTimeHandler,com.teambition.kafka.connect.mongo.assemble.handlers.ScenarioFieldConfigHandler","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","name":"mongo-assemble-tasks-source-connector"},"tasks":[{"connector":"mongo-assemble-tasks-source-connector","task":0},{"connector":"mongo-assemble-tasks-source-connector","task":1}]}

# Remove source controller


```bash
curl -XDELETE http://kafka:38093/connectors/mongo-assemble-tasks-source-connector
```

    
