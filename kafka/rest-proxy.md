

```bash
# Topics
curl http://kafka:38082/topics
```

    ["_schemas","avrotest","binarytest","jsontest"]


```bash
# One topic
curl http://kafka:38082/topics/avrotest
```

    {"name":"avrotest","configs":{},"partitions":[{"partition":0,"leader":1,"replicas":[{"broker":1,"leader":true,"in_sync":true}]}]}


```bash
# Topic partitions
curl http://kafka:38082/topics/avrotest/partitions
```

    [{"partition":0,"leader":1,"replicas":[{"broker":1,"leader":true,"in_sync":true}]}]

# Produce and Consume Avro Messages


```bash
curl -X POST -H "Content-Type: application/vnd.kafka.avro.v1+json" \
      --data '{"value_schema": "{\"type\": \"record\", \"name\": \"User\", \"fields\": [{\"name\": \"name\", \"type\": \"string\"}]}", "records": [{"value": {"name": "testUser"}}]}' \
      "http://kafka:38082/topics/avrotest"
```

    {"offsets":[{"partition":0,"offset":1,"error_code":null,"error":null}],"key_schema_id":null,"value_schema_id":1}


```bash
# Create a consumer for Avro data, starting at the beginning of the topic's
# log. Then consume some data from a topic, which is decoded, translated to
# JSON, and included in the response. The schema used for deserialization is
# fetched automatically from the schema registry. Finally, clean up.
curl -X POST -H "Content-Type: application/vnd.kafka.v1+json" \
      --data '{"name": "my_consumer_instance", "format": "avro", "auto.offset.reset": "smallest"}' \
      http://kafka:38082/consumers/my_avro_consumer
```

    {"instance_id":"my_consumer_instance","base_uri":"http://192.168.0.21:8082/consumers/my_avro_consumer/instances/my_consumer_instance"}


```bash
curl -X GET -H "Accept: application/vnd.kafka.avro.v1+json" \
      http://kafka:38082/consumers/my_avro_consumer/instances/my_consumer_instance/topics/avrotest
```

    [{"key":null,"value":{"name":"testUser"},"partition":0,"offset":0},{"key":null,"value":{"name":"testUser"},"partition":0,"offset":1}]


```bash
curl -X DELETE \
      http://kafka:38082/consumers/my_avro_consumer/instances/my_consumer_instance
```

    

# Produce and Consume JSON Messages


```bash
# Produce a message using JSON with the value '{ "foo": "bar" }' to the topic jsontest
curl -X POST -H "Content-Type: application/vnd.kafka.json.v1+json" \
      --data '{"records":[{"value":{"foo":"bar"}}]}' "http://kafka:38082/topics/jsontest"
```

    {"offsets":[{"partition":0,"offset":0,"error_code":null,"error":null}],"key_schema_id":null,"value_schema_id":null}


```bash
# Create a consumer for JSON data, starting at the beginning of the topic's
# log. Then consume some data from a topic using the base URL in the first response.
# Finally, close the consumer with a DELETE to make it leave the group and clean up
# its resources.
curl -X POST -H "Content-Type: application/vnd.kafka.v1+json" \
      --data '{"name": "my_consumer_instance", "format": "json", "auto.offset.reset": "smallest"}' \
      http://kafka:38082/consumers/my_json_consumer
```

    {"instance_id":"my_consumer_instance","base_uri":"http://192.168.0.21:8082/consumers/my_json_consumer/instances/my_consumer_instance"}


```bash
curl -X GET -H "Accept: application/vnd.kafka.json.v1+json" \
      http://kafka:38082/consumers/my_json_consumer/instances/my_consumer_instance/topics/jsontest
```

    {"error_code":50002,"message":"Kafka error: com.fasterxml.jackson.core.JsonParseException: Unrecognized token 'Kafka': was expecting ('true', 'false' or 'null')\n at [Source: [B@3d012ed7; line: 1, column: 11]"}


```bash
curl -X DELETE \
      http://kafka:38082/consumers/my_json_consumer/instances/my_consumer_instance
```

    
