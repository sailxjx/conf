

```bash
cd /Users/tristan/coding/opensource/confluent-3.1.0
```

    

### 创建 topic


```bash
./bin/kafka-topics --create --zookeeper kafka:32181 \
    --topic test_default_replica --partitions 1 --replication-factor 3
```

    WARNING: Due to limitations in metric names, topics with a period ('.') or underscore ('_') could collide. To avoid issues it is best to use either, but not both.
    Created topic "test_default_replica".



```bash
./bin/kafka-topics --describe --zookeeper kafka:32181 \
    --topic mongo_21_t_d
```

    Topic:mongo_21_t_d	PartitionCount:1	ReplicationFactor:3	Configs:
    	Topic: mongo_21_t_d	Partition: 0	Leader: 1	Replicas: 1,3,2	Isr: 1,3,2



```bash
./bin/kafka-topics --list --zookeeper kafka:32181
```

    __consumer_offsets
    _schemas
    connect-mongo-configs-2
    connect-mongo-configs-3
    connect-mongo-offsets
    connect-mongo-offsets-2
    connect-mongo-offsets-3
    connect-mongo-status-2
    connect-mongo-status-3
    file-connect-test
    mongo_21_avro_activities
    mongo_21_pay_orders
    mongo_21_test_users
    mongo_local_test_users
    mongodb_local_test_users
    mongodbprefix_mydb_test1
    teambition_activities
    test


### Send some messages


```bash
./bin/kafka-console-producer --broker-list 192.168.0.124:39092 --topic test
```

    

### Consume a topic


```bash
# Listen to a topic `from beginning`
./bin/kafka-console-consumer  --zookeeper 192.168.0.124:32181 --topic wikipedia-raw --from-beginning

# >= 3.1.0
./bin/kafka-console-consumer --bootstrap-server 192.168.0.124:39092 --topic test --from-beginning

# 包含 key
./bin/kafka-console-consumer --bootstrap-server 192.168.0.124:39092 --property print.key=true --topic test --from-beginning
```

### 删除 topic


```bash
kafka-topics --delete --zookeeper kafka:32181 --topic mongo_assemble_activities_fact
```

### 查询 topic 配置


```bash
./bin/kafka-configs --describe --zookeeper 192.168.0.124:32181 --entity-type topics
```

    Configs for topics:test are 
    Configs for topics:mongo_local_test_users are 
    Configs for topics:_schemas are cleanup.policy=compact
    Configs for topics:mongo_21_teambition_tasks are 
    Configs for topics:__consumer_offsets are segment.bytes=104857600,cleanup.policy=compact,compression.type=producer
    Configs for topics:mongo_local_test_emails are 
    Configs for topics:mongo_21_pay_orders are cleanup.policy=delete



```bash
./bin/kafka-configs --help
```

    Command must include exactly one action: --describe, --alter
    Option              Description                            
    ------              -----------                            
    --add-config        Key Value pairs configs to add 'k1=v1, 
                          k2=v2'. The following is a list of   
                          valid configurations: For            
                          entity_type 'topics':                
                        	cleanup.policy                        
                        	compression.type                      
                        	delete.retention.ms                   
                        	file.delete.delay.ms                  
                        	flush.messages                        
                        	flush.ms                              
                        	index.interval.bytes                  
                        	max.message.bytes                     
                        	message.format.version                
                        	message.timestamp.difference.max.ms   
                        	message.timestamp.type                
                        	min.cleanable.dirty.ratio             
                        	min.insync.replicas                   
                        	preallocate                           
                        	retention.bytes                       
                        	retention.ms                          
                        	segment.bytes                         
                        	segment.index.bytes                   
                        	segment.jitter.ms                     
                        	segment.ms                            
                        	unclean.leader.election.enable        
                        For entity_type 'clients':             
                        	producer_byte_rate                    
                        	consumer_byte_rate                    
    --alter             Alter the configuration for the entity.
    --delete-config     config keys to remove 'k1,k2'          
    --describe          List configs for the given entity.     
    --entity-name       Name of entity (topic name/client id)  
    --entity-type       Type of entity (topics/clients)        
    --help              Print usage information.               
    --zookeeper <urls>  REQUIRED: The connection string for    
                          the zookeeper connection in the form 
                          host:port. Multiple URLS can be      
                          given to allow fail-over.            


### 修改 topic 配置


```bash
./bin/kafka-configs --zookeeper 192.168.0.124:32181 --entity-type topics --entity-name mongo_21_pay_orders \
            --alter --add-config cleanup.policy=delete
```

    Updated config for topic: "mongo_21_pay_orders".


### 查看单个 topic 配置


```bash
./bin/kafka-configs --describe --zookeeper 192.168.0.124:32181 --entity-type topics --entity-name mongo_21_pay_orders
```

    Configs for topics:mongo_21_pay_orders are cleanup.policy=compact


# kafka rest


```bash
# Get topics
curl -XGET http://192.168.0.124:38082/topics
```

    ["__consumer_offsets","_schemas","mongo_local_test_users","test"]
