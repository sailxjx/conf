

```bash
cd /Users/tristan/coding/opensource/confluent-3.1.0
```

    

### Create a topic


```bash
./bin/kafka-topics --create --zookeeper 192.168.0.21:2181 --replication-factor 1 --partitions 1 --topic test
```

    Created topic "test".



```bash
./bin/kafka-topics --list --zookeeper 192.168.0.124:32181
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

### 删除 topic


```bash
./bin/kafka-topics --delete --zookeeper localhost:2181 --topic try-test
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


```bash

```
