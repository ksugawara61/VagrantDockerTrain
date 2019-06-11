#!/bin/bash

sudo mkdir -p /opt/bin

# for docker-compose setting
sudo curl -L https://github.com/docker/compose/releases/download/1.6.2/run.sh > /opt/bin/docker-compose
sudo chmod +x /opt/bin/docker-compose
docker-compose --version
