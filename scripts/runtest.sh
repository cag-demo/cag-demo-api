#!/bin/bash
#
# Run tests on application.
# All script files matching *.sh in the directory "tests" are run.
#
export INSTANCE=${PIPELINE_ENV}
export API_BASE_URL=$1
set -e

# This script can be called both from autosmall where the API_BASE_URL is built from the IP address from docker inspect
# and in later stages where the $API_BASE_URL should be a tutum endpoint.
if [ ! "$API_BASE_URL" ]; then
    echo API_BASE_URL not set, building one calling docker inspect ...
    # Get ip address of the docker instance
    CONTAINER_IP=`docker inspect cag-demo-api-${INSTANCE} | grep \"IPAddress\" | awk -F'\"' '{print $4}' | head -n 1`
    API_BASE_URL=http://${CONTAINER_IP}:8080
fi

# Use the smoke test to wait for system coming up
timeout 3m bash runsmoketestuntilkilled.sh

# Run all tests
for f in ../tests/${INSTANCE}/*.sh; do
    echo Processing $f file with INSTANCE=${INSTANCE}, API_BASE_URL=${API_BASE_URL} ...
    bash $f
    echo Done with $f
done
