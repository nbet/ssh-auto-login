#!/bin/bash

sudo docker build -t test .
sudo docker run \
     -d \
     -e HOST_USER=pfang \
     -e HOST_NAME=172.16.160.148 \
     -v /home/pfang/.ssh:/app/ssh \
     test ./entrypoint.sh

