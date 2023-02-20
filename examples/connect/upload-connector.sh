#! /bin/bash

echo "checking kafka connect is available"
curl connect:8083 | jq

echo "posting the connector"
curl -s -X POST -H 'Content-Type: application/json' -d '{ "name": "datagen-pageviews", "config": { "connector.class": "io.confluent.kafka.connect.datagen.DatagenConnector", "kafka.topic": "pageviews", "confluent.topic.bootstrap.servers": "kafka:9092", "confluent.license": "", "key.converter": "org.apache.kafka.connect.storage.StringConverter", "quickstart": "pageviews", "max.interval": 100, "tasks.max": "1" } }' http://connect:8083/connectors | jq .

echo "check the connector added"
curl connect:8083/connectors | jq

echo "get connector config"
curl connect:8083/connectors/datagen-pageviews/config | jq


#echo "posting the connector"
#curl -s -X POST -H 'Content-Type: application/json' -d '{ "name": "increment-connector", "config": { "connector.class": "org.source.IncrementSourceConnector", "confluent.topic.bootstrap.servers": "kafka:9092", "confluent.license": "", "key.converter": "org.apache.kafka.connect.storage.StringConverter", "max.interval": 100, "tasks.max": "2", "increments": "1,100", "topic.prefix": "seq_"} }' http://connect:8083/connectors | jq .
