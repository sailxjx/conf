# Install bash on alpine

```
RUN apk add --update bash && \
    rm -rf /var/cache/apk/*
```

# Install on alpine

```
RUN apk add --no-cache your-app
```
