```coffeescript
feedParser = new FeedParser()

readableStream = new stream.Readable()
readableStream._read = ->
readableStream.pipe feedParser

feed = items: []

feedParser.on 'error', reject
feedParser.on 'readable', ->
  while item = @read()
    feed.items.push item

readableStream.push body
readableStream.push null
readableStream.on 'end', ->
  resolve feed
```
