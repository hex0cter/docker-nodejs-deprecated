FROM alpine:latest

ARG NODE_VERION
RUN apk --no-cache update && \
    apk add python gcc g++ make linux-headers && \
    wget --quiet https://nodejs.org/download/release/v${NODE_VERION}/node-v${NODE_VERION}.tar.gz && \
    tar zxf node-v${NODE_VERION}.tar.gz -C /tmp && rm -rf node-v${NODE_VERION}.tar.gz && \
    cd /tmp/node-v${NODE_VERION} && ./configure && make && make install && rm -rf /tmp/node-v${NODE_VERION} && \
    apk del gcc g++ make linux-headers
