# elk-stack in one Docker

### Usage

    docker build -t elk-stack . 

    docker run -d -p 9200:9200 -p 5601:5601 elk-stack
    
Elasticsearch - `localhost:9200`

Kibana - `localhost:5601`
