#!/bin/bash

# build all docker images
cd containers/Genesis && docker build -t besu .

# build the docker image for nodes
cd ../Nodes && docker build -t node .

# run compose file for all besu network
cd ../ && docker-compose up -d

# run compose file for explorer
cd chainlens-free/docker-compose && NODE_ENDPOINT=http://172.16.239.1:8545 docker-compose up --force-recreate -d | tee chainlens.log