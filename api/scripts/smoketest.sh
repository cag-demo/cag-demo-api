#!/bin/bash

INSTANCE=$DOODLE_ENV
PORT=8080

# Get the IPAdress of the docker instans
DOODLE_IP=`docker inspect cag-demo-api-${INSTANCE} | grep IPAddress | awk -F'\"' '{print $4}'`
# Basic smoketest, TODO: should be changed to environment?
if ! `curl -f http://${DOODLE_IP}:${PORT}/version | grep 'version:' >/dev/null`
then
    echo "Test failed (curl http://${DOODLE_IP}:${PORT}/version | grep 'version:' >/dev/null)"
    exit 1
fi
# More tests here!
exit 0
