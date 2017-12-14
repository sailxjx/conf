
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

    

# Mongo source connector
## Create source connector


```bash
# Create connector
curl -X POST -H "Content-Type: application/json" http://kafka-connect-mongo.dev22/connectors -d '{
  "name": "mongo_source_test",
  "config": {
    "connector.class": "org.apache.kafka.connect.mongo.MongoSourceConnector",
    "tasks.max": 8,
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin",
    "batch.size": 100,
    "schema.name": "mongo_test_schema",
    "topic.prefix": "mongo_test",
    "initial.import": "true",
    "databases":"pay.activities,pay.customers,pay.deals,pay.orders,pay.organizations,pay.peoples,pay.toids,spider.orgs,teambition.activities,teambition.apprelations,teambition.collections,teambition.customfields,teambition.events,teambition.groups,teambition.idmaps,teambition.linkprojects,teambition.members,teambition.objectlinks,teambition.organizations,teambition.posts,teambition.projects,teambition.rules,teambition.stages,teambition.tags,teambition.tasklists,teambition.tasks,teambition.teams,teambition.users,teambition.usersources,teambition.versions,teambition.weeklyactivenesses,teambition.works,teambition.worktimes"
  }
}'
```

    {"name":"mongo_source_test","config":{"connector.class":"org.apache.kafka.connect.mongo.MongoSourceConnector","tasks.max":"8","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","batch.size":"100","schema.name":"mongo_test_schema","topic.prefix":"mongo_test","initial.import":"true","databases":"pay.activities,pay.customers,pay.deals,pay.orders,pay.organizations,pay.peoples,pay.toids,spider.orgs,teambition.activities,teambition.apprelations,teambition.collections,teambition.customfields,teambition.events,teambition.groups,teambition.idmaps,teambition.linkprojects,teambition.members,teambition.objectlinks,teambition.organizations,teambition.posts,teambition.projects,teambition.rules,teambition.stages,teambition.tags,teambition.tasklists,teambition.tasks,teambition.teams,teambition.users,teambition.usersources,teambition.versions,teambition.weeklyactivenesses,teambition.works,teambition.worktimes","name":"mongo_source_test"},"tasks":[]}


```bash
# Create dev connector
curl -X POST -H "Content-Type: application/json" http://127.0.0.1:38083/connectors -d '{
  "name": "mongo-source-dev",
  "config": {
    "connector.class": "MongoSourceConnector",
    "tasks.max": 2,
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin",
    "batch.size": 100,
    "schema.name": "mongo_dev_schema",
    "topic.prefix": "mongo_dev",
    "initial.import": "true",
    "databases":"teambition.posts"
  }
}'
```

    {"name":"mongo-source-dev","config":{"connector.class":"MongoSourceConnector","tasks.max":"2","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","batch.size":"100","schema.name":"mongo_dev_schema","topic.prefix":"mongo_dev","initial.import":"true","databases":"teambition.posts","name":"mongo-source-dev"},"tasks":[{"connector":"mongo-source-dev","task":0}],"type":null}


```bash
# Create cron connector
curl -X POST -H "Content-Type: application/json" http://kafka-connect-mongo.dev22/connectors -d '{
  "name": "mongo_cron_source_test",
  "config": {
    "connector.class": "org.apache.kafka.connect.mongo.MongoCronSourceConnector",
    "tasks.max": 1,
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin",
    "batch.size": 100,
    "schema.name": "mongo_test_schema",
    "topic.prefix": "mongo_test",
    "databases":"pay.salers,pay.users,teambition.applications,teambition.exportedlogs,teambition.projecttemplates",
    "schedule": "0 0 01 * * ?",
    "name": "mongo_cron_source_test"
  }
}'
```

    {"name":"mongo_cron_source_test","config":{"connector.class":"org.apache.kafka.connect.mongo.MongoCronSourceConnector","tasks.max":"1","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","batch.size":"100","schema.name":"mongo_test_schema","topic.prefix":"mongo_test","databases":"pay.salers,pay.users,teambition.applications,teambition.exportedlogs,teambition.projecttemplates","schedule":"0 0 01 * * ?","name":"mongo_cron_source_test"},"tasks":[]}


```bash
curl -X DELETE http://kafka-connect-mongo.dev22/connectors/mongo_cron_source_test
```

    

## Update source connector


```bash
curl -X PUT -H "Content-Type: application/json" http://kafka-connect-mongo.dev22/connectors/mongo_source_test/config -d '{
    "connector.class": "MongoSourceConnector",
    "databases": "teambition.favorites,teambition.ccfs,teambition.messages,kbs.workspaces,teambition.okrperiods,teambition.consumers,teambition.okrobjectives,teambition.okrkeyresults,teambition.projecttags,kbs.documents,kbs.workspace.documents,pay.tasktypes,core.tasks,teambition.scenariofieldconfigs,pay.activities,pay.customers,pay.deals,pay.orders,pay.organizations,pay.peoples,pay.sourcelogs,pay.toids,spider.orgs,teambition.activities,teambition.apprelations,teambition.collections,teambition.customfields,teambition.entries,teambition.events,teambition.groups,teambition.idmaps,teambition.linkprojects,teambition.members,teambition.objectlinks,teambition.organizations,teambition.posts,teambition.projects,teambition.rooms,teambition.rules,teambition.stages,teambition.tags,teambition.tasklists,teambition.tasks,teambition.teams,teambition.users,teambition.usersources,teambition.versions,teambition.weeklyactivenesses,teambition.works,teambition.worktimes",
    "initial.import": "true",
    "topic.prefix": "mongo_test",
    "tasks.max": "8",
    "batch.size": "100",
    "schema.name": "mongo_test_schema",
    "name": "mongo_source_test",
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin"
  }'
```

    {"name":"mongo_source_test","config":{"connector.class":"MongoSourceConnector","databases":"teambition.favorites,teambition.ccfs,teambition.messages,kbs.workspaces,teambition.okrperiods,teambition.consumers,teambition.okrobjectives,teambition.okrkeyresults,teambition.projecttags,kbs.documents,kbs.workspace.documents,pay.tasktypes,core.tasks,teambition.scenariofieldconfigs,pay.activities,pay.customers,pay.deals,pay.orders,pay.organizations,pay.peoples,pay.sourcelogs,pay.toids,spider.orgs,teambition.activities,teambition.apprelations,teambition.collections,teambition.customfields,teambition.entries,teambition.events,teambition.groups,teambition.idmaps,teambition.linkprojects,teambition.members,teambition.objectlinks,teambition.organizations,teambition.posts,teambition.projects,teambition.rooms,teambition.rules,teambition.stages,teambition.tags,teambition.tasklists,teambition.tasks,teambition.teams,teambition.users,teambition.usersources,teambition.versions,teambition.weeklyactivenesses,teambition.works,teambition.worktimes","initial.import":"true","topic.prefix":"mongo_test","tasks.max":"8","batch.size":"100","schema.name":"mongo_test_schema","name":"mongo_source_test","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin"},"tasks":[{"connector":"mongo_source_test","task":0},{"connector":"mongo_source_test","task":1},{"connector":"mongo_source_test","task":2}]}


```bash
curl -X PUT -H "Content-Type: application/json" http://kafka-connect-mongo.dev22/connectors/mongo_cron_source_test/config -d '{
    "connector.class": "MongoCronSourceConnector",
    "tasks.max": 1,
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin",
    "batch.size": 100,
    "initial.import": "true",
    "schema.name": "mongo_test_schema",
    "topic.prefix": "mongo_test",
    "databases":"pay.salers,pay.users,teambition.applications,teambition.customfieldlinks,teambition.exportedlogs,teambition.projecttemplates",
    "schedule": "0 0 01 * * ?",
    "name": "mongo_cron_source_test"
}'
```

    {"name":"mongo_cron_source_test","config":{"connector.class":"MongoCronSourceConnector","tasks.max":"1","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","batch.size":"100","initial.import":"true","schema.name":"mongo_test_schema","topic.prefix":"mongo_test","databases":"pay.salers,pay.users,teambition.applications,teambition.customfieldlinks,teambition.exportedlogs,teambition.projecttemplates","schedule":"0 0 01 * * ?","name":"mongo_cron_source_test"},"tasks":[]}


```bash
# Create mongodb connector by datareply
curl -X POST -H "Content-Type: application/json" http://192.168.1.87:38083/connectors -d '{
  "name": "file-source-activity",
  "config": {
    "connector.class": "FileStreamSource",
    "tasks.max": 1,
    "file": "activity.log",
    "topic": "file-connect-test"
  }
}'
```

    {"name":"file-source-activity","config":{"connector.class":"FileStreamSource","tasks.max":"1","file":"activity.log","topic":"file-connect-test","name":"file-source-activity"},"tasks":[]}


```bash
# Get connectors
curl http://kafka:38084/connectors
```

    {"error_code":500,"message":"Request timed out"}


```bash
# Restart task
curl -XPOST http://kafka-connect-mongo.dev22/connectors/mongo_cron_source_test/restart
```

    {"error_code":500,"message":"Failed to start connector: mongo_cron_source_test"}


```bash
# Delete connectors
curl -XDELETE http://kafka:38083/connectors/mongo_source_21
```

    

# Add mongo sink connector


```bash
# Create connector
curl -X POST -H "Content-Type: application/json" http://kafka:58083/connectors -d '{
  "name": "mongo_sink_21_mt_users",
  "config": {
    "connector.class": "org.apache.kafka.connect.mongo.MongoSinkConnector",
    "tasks.max": 1,
    "mongo.uri": "mongodb://root:root@192.168.0.21:27017/?authSource=admin",
    "topics": "mongo_21_test_users",
    "databases":"mt.users"
  }
}'
```

    {"name":"mongo_sink_21_mt_users","config":{"connector.class":"org.apache.kafka.connect.mongo.MongoSinkConnector","tasks.max":"1","mongo.uri":"mongodb://root:root@192.168.0.21:27017/?authSource=admin","topics":"mongo_21_test_users","databases":"mt.users","name":"mongo_sink_21_mt_users"},"tasks":[]}


```bash
# Delete connectors
curl -XDELETE http://kafka04:8084/connectors/mongo-source-03-teambition-users
```

    
