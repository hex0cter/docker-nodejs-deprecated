FROM alpine:latest

ARG NODE_VERION
RUN apk --no-cache update && \
    apk add python gcc g++ make linux-headers
RUN wget --quiet https://nodejs.org/download/release/v${NODE_VERION}/node-v${NODE_VERION}.tar.gz
RUN tar zxf node-v${NODE_VERION}.tar.gz
RUN cd node-v${NODE_VERION} && ./configure && make
RUN cd node-v${NODE_VERION} && make install

