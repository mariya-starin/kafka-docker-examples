#! /bin/bash

docker container run -d \
    --name producer \
    --net consumer_default \
    cnfltraining/vp-producer:v2