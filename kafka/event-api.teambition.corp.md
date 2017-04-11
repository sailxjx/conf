
# Event API 介绍
Event api 提供了对 Kafka 的写入功能，支持 JSON/Avro 方式写入，用户端只需定义请求数据的结构，事件名等必要参数，向 API 提交请求，数据服务将这些数据保存到 HDFS 并提供 OLAP 查询接口

## API URL
* Dev http://event-api.dev22
* Production http://event-api.teambition.corp

## 数据格式


```bash
# 发送 JSON 格式
cat << EOF > event-json.json
{
  "records": [
    {
      "value": {
        "foo": "bar"
      }
    }
  ]
}
EOF
curl -X POST -H "Content-Type: application/vnd.kafka.json.v1+json" \
    -d @event-json.json "http://event-api.dev22"
```
