#!/bin/bash

#
# Run tests on application.
# All script files matching *.sh in the directory "tests" are run.
#

export INSTANCE=${PIPELINE_ENV}
export PORT_PREFIX=$1
export PORT=8080

set -e

# Get ip address of the docker instance
CONTAINER_IP=`docker inspect cag-demo-api-${INSTANCE} | grep \"IPAddress\" | awk -F'\"' '{print $4}' | head -n 1`
API_BASE_URL=http://$CONTAINER_IP:$PORT

for f in ../tests/${INSTANCE}/*.sh
do
    echo Processing $f file, API_BASE_URL=API_BASE_URL ...
    bash $f API_BASE_URL
    echo Done with $f
done

