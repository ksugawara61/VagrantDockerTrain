#!/bin/bash

# for Rancher settings
docker run --name rancher01 -h rancher01 -d --restart=unless-stopped -p 8080:80 -p 8443:443 rancher/rancher
