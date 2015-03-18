MySQL                     elasticsearch
database                  index
table                     type

table schema              mapping
row                       document
field                     field

http://localhost:9200/{index}/{type}/{id}


处理 null 值， exists|missing, http://www.elasticsearch.org/guide/en/elasticsearch/guide/current/_dealing_with_null_values.html

# 安装 analysis-ik

sudo plugin --url https://raw.githubusercontent.com/medcl/elasticsearch-rtf/master/plugins/analysis-ik/elasticsearch-analysis-ik-1.2.6.jar --install analysis-ik

# query_string|match|match_phrase 区别

- query_string 支持 [lucene query syntax](http://www.lucenetutorial.com/lucene-query-syntax.html), and, or 等等
- match 匹配单词
- match_phrase 匹配整句，顺序相关
