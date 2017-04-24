curl -X POST <http://url>

# 增加额外请求头

curl -H "X-First-Name: Joe" <http://192.168.0.1/>

# json from file

curl -vX POST http://server/api/v1/places.json -d @testplace.json \
  --header "Content-Type: application/json"
