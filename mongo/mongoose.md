## dropDatabase
mongoose.db.executeDbCommand dropDatabase: 1

## querystream
stream = model.find().stream()
stream
  .on 'data', (doc) ->
  .on 'close', -> console.log 'close'
在操作大批量数据时比较有效
