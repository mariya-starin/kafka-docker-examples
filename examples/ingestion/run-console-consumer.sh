#! /bin/bash

kafka-console-consumer --bootstrap-server localhost:9092 --topic vehicle-positions --from-beginning