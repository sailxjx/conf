### 发送 POST 请求

siege -c2 -t2S -T 'application/vnd.kafka.json.v1+json' 'http://localhost:38082/topics/jsontest POST {"records":[{"value":{"foo":"bar"}}]}'
