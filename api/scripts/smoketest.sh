#!/bin/bash

#
# Run smoke test.
#

INSTANCE=$PIPELINE_ENV
PORT=8080

# Get ip address of the docker instance
CONTAINER_IP=`docker inspect cag-demo-api-${INSTANCE} | grep IPAddress | awk -F'\"' '{print $4}'`
echo smoketest.sh: CONTAINER_IP is $CONTAINER_IP

# Run basic smoke test: Call the /version endpoint and verify success.
if ! `curl -f http://${CONTAINER_IP}:${PORT}/version | grep 'version:' >/dev/null`
then
    echo "Test failed (curl http://${CONTAINER_IP}:${PORT}/version | grep 'version:' >/dev/null)"
    exit 1
fi

echo smoketest.sh succeeded.
