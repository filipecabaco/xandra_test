#!/bin/sh

docker kill c1 c2 c3
docker rm c1 c2 c3

docker run --name c1 -d -p 9042:9042 cassandra:3.0.9
docker run --name c2 -d -p 9142:9042 -e CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' c1)" cassandra:3.0.9
docker run --name c3 -d -p 9242:9042 -e CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' c1)" cassandra:3.0.9
#docker exec c1 nodetool status
