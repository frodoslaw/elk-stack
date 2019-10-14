# elk-stack in one Docker

[![Build Status](https://travis-ci.org/frodoslaw/elk-stack.svg?branch=master)](https://travis-ci.org/frodoslaw/elk-stack)

### Usage

    docker build -t elk-stack . 

    docker run -d -p 9200:9200 -p 5601:5601 elk-stack
    
Elasticsearch - `localhost:9200`

Kibana - `localhost:5601`
