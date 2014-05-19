# Steps to initial sync the data of a river
# Remove the river
DELETE /_river/events
# Remove the type or index
DELETE  /teambition/events
# Remapping the type or index
POST /teambition/events/_mapping
{
  "properties": {
    "title": {
      "type": "string",
      "term_vector": "with_positions_offsets",
      "analyzer": "ik"
    },
    "content": {
      "type": "string",
      "term_vector": "with_positions_offsets",
      "analyzer": "ik"
    },
    "location": {
      "type": "string",
      "term_vector": "with_positions_offsets",
      "analyzer": "ik"
    }
  }
}
# Recreate the river
POST /_river/events/_meta
{
  "type": "mongodb",
  "mongodb": {
    "options": {
      "include_fields": [
        "_id",
        "isDeleted",
        "created",
        "updated",
        "_projectId",
        "content",
        "_creatorId",
        "title",
        "startDate",
        "endDate",
        "location"
      ]
    },
    "db": "teambition",
    "collection": "events",
    "servers": [
      {
        "host": "192.168.0.21",
        "port": 27017
      },
      {
        "host": "192.168.0.21",
        "port": 27021
      }
    ]
  },
  "index": {
    "name": "teambition",
    "type": "events"
  }
}
