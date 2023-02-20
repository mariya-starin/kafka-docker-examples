#! /bin/bash


kafka-topics --bootstrap-server kafka:9092 \
    --topic vehicle-positions \
    --create \
    --partitions 6 \
    --replication-factor 1
