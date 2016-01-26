#!/bin/bash

INSTANCE=$PIPELINE_ENV
PORT=8080

# Get the IPAdress of the docker instance
CONTAINER_IP=`docker inspect cag-demo-api-${INSTANCE} | grep IPAddress | awk -F'\"' '{print $4}'`
echo "CONTAINER_IP: " + $CONTAINER_IP
# Basic smoketest, TODO: should be changed to environment?
if ! `curl -f http://${CONTAINER_IP}:${PORT}/version | grep 'version:' >/dev/null`
then
    echo "Test failed (curl http://${CONTAINER_IP}:${PORT}/version | grep 'version:' >/dev/null)"
    exit 1
fi
# More tests here!
exit 0
