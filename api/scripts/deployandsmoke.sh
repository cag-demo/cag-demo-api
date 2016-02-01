#!/bin/bash

#
# Deploy app and verify that the deployment works by running a smoke test.
# This script is called by the pipeline in all environments.
#

INSTANCE=${PIPELINE_ENV}
PORT_PREFIX=$1
PORT=8080

set -e
# New version
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SCRIPT_DIR=$(dirname $(readlink -f $0))
VERSION=`grep AppVersion ${SCRIPT_DIR}/../BuildInfo.properties | awk -F'=' '{print $2}'`

# Kill old instances
echo running  docker rm -f cag-demo-api-${INSTANCE}
docker rm -f cag-demo-api-${INSTANCE} || /bin/true

# Start a new instance
# Is depending on directory name running docker-compose up in!! Ugly!!
echo running  docker run -d -e "PIPELINE_ENV=${PIPELINE_ENV}" --name cag-demo-api-${INSTANCE} -p ${PORT}:${PORT} cag-demo-api:$VERSION
docker run -d -e "PIPELINE_ENV=${PIPELINE_ENV}" --name cag-demo-api-${INSTANCE} -p ${PORT}:${PORT} cag-demo-api:$VERSION

# Run smoke test
timeout 3m bash runsmoketestuntilkilled.sh
