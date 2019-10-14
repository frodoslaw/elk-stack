FROM node:10.15.2-alpine
MAINTAINER Radoslaw Frackiewicz <frodoslaw@gmail.com>

ARG elk_version=7.2.0

RUN apk add --quiet --no-progress --no-cache openjdk8-jre-base nss \
 && adduser -D elasticsearch

USER elasticsearch

WORKDIR /home/elasticsearch

ENV ES_TMPDIR=/home/elasticsearch/elasticsearch.tmp \
    ES_DATADIR=/home/elasticsearch/elasticsearch/data \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

RUN wget -q -O - https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-${elk_version}-linux-x86_64.tar.gz \
 |  tar -zx \
 && mv elasticsearch-${elk_version} elasticsearch \
 && mkdir -p ${ES_TMPDIR} ${ES_DATADIR} \
 && wget -q -O - https://artifacts.elastic.co/downloads/kibana/kibana-oss-${elk_version}-linux-x86_64.tar.gz \
 |  tar -zx \
 && mv kibana-${elk_version}-linux-x86_64 kibana \
 && rm -f kibana/node/bin/node \
 && ln -s $(which node) kibana/node/bin/node

CMD sh elasticsearch/bin/elasticsearch -E http.host=0.0.0.0 --quiet & kibana/bin/kibana --host 0.0.0.0 -Q

EXPOSE 9200 5601
