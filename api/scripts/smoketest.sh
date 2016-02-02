#!/bin/bash

#
# Run smoke test: Call REST endpoint GET /version and verify that the response string
# contains the text "version".
#

INSTANCE=$PIPELINE_ENV
PORT=8080

# Get ip address of the docker instance
CONTAINER_IP=`docker inspect cag-demo-api-${INSTANCE} | grep \"IPAddress\" | awk -F'\"' '{print $4}' | head -n 1`

# Run basic smoke test: Call the /version endpoint and verify success.
if ! `curl -s -f http://${CONTAINER_IP}:${PORT}/version | grep 'version' >/dev/null`
then
    echo "smoketest.sh failed (tried endpoint /version)"
    exit 1
fi
