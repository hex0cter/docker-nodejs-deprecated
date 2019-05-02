FROM alpine:latest

RUN apk --no-cache update \
  && apk add nodejs
