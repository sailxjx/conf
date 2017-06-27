
# Create source connector


```bash
# Create connector
curl -X POST -H "Content-Type: application/json" http://localhost:38093/connectors -d '{
  "name": "mongo-assemble-tasks-source-connector",
  "config": {
    "connector.class": "com.teambition.kafka.connect.mongo.assemble.MongoSourceConnector",
    "tasks.max": 1,
    "batch.size": 100,
    "schema.name": "mongo_assemble_tasks_source_connector_schema",
    "topic": "mongo_assemble_tasks_source_connector_topic",
    "handler.name": "com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandler",
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin",
    "schema.config": "table: tasks_dimension\ncolumns:\n- name: _id\n  type: VARCHAR(50)\n- name: _tasklistId\n  type: VARCHAR(24)\n- name: _stageId\n  type: VARCHAR(24)\n- name: _creatorId\n  type: VARCHAR(24)\n- name: _projectId\n  type: VARCHAR(24)\n- name: _executorId\n  type: VARCHAR(24)\n- name: priority\n  type: INT\n- name: accomplished\n  type: TIMESTAMP\n- name: created\n  type: TIMESTAMP\n- name: dueDate\n  type: TIMESTAMP\n- name: startDate\n  type: TIMESTAMP\n- name: involveMembers\n  type: JSONB ARRAY\n- name: customfields\n  type: JSONB ARRAY\n- name: tagIds\n  type: JSONB ARRAY\n- name: workTime\n  type: JSONB\n- name: isArchived\n  type: BOOLEAN\n- name: isDeleted\n  type: BOOLEAN\n- name: isSubtask\n  type: BOOLEAN\n- name: _organizationId\n  type: VARCHAR(24)\n"
  }
}'
```

    {"name":"mongo-assemble-tasks-source-connector","config":{"connector.class":"com.teambition.kafka.connect.mongo.assemble.MongoSourceConnector","tasks.max":"1","batch.size":"100","schema.name":"mongo_assemble_tasks_source_connector_schema","topic":"mongo_assemble_tasks_source_connector_topic","handler.name":"com.teambition.kafka.connect.mongo.assemble.handlers.TaskHandler","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","schema.config":"table: tasks_dimension\ncolumns:\n- name: _id\n  type: VARCHAR(50)\n- name: _tasklistId\n  type: VARCHAR(24)\n- name: _stageId\n  type: VARCHAR(24)\n- name: _creatorId\n  type: VARCHAR(24)\n- name: _projectId\n  type: VARCHAR(24)\n- name: _executorId\n  type: VARCHAR(24)\n- name: priority\n  type: INT\n- name: accomplished\n  type: TIMESTAMP\n- name: created\n  type: TIMESTAMP\n- name: dueDate\n  type: TIMESTAMP\n- name: startDate\n  type: TIMESTAMP\n- name: involveMembers\n  type: JSONB ARRAY\n- name: customfields\n  type: JSONB ARRAY\n- name: tagIds\n  type: JSONB ARRAY\n- name: workTime\n  type: JSONB\n- name: isArchived\n  type: BOOLEAN\n- name: isDeleted\n  type: BOOLEAN\n- name: isSubtask\n  type: BOOLEAN\n- name: _organizationId\n  type: VARCHAR(24)\n","name":"mongo-assemble-tasks-source-connector"},"tasks":[{"connector":"mongo-assemble-tasks-source-connector","task":0}]}

# Remove source controller


```bash
curl -XDELETE http://localhost:38093/connectors/mongo-assemble-tasks-source-connector
```

    
