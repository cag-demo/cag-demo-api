#!/bin/bash
# Deploy and run smoketest on app
INSTANCE=${PIPELINE_ENV}
PORT_PREFIX=$1
LEG=$2
PORT=8080
M_PORT=9200
EPORT=8080
set -ex
if [ ${LEG} = 'green' ]; then
  EPORT=8081
fi

if [ ${LEG} = 'blue' ]; then
  EPORT=8082
fi

# Newversion
#VERSION=${GO_PIPELINE_LABEL} (Old, may not always working futher down in the dependency chain)
# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SCRIPT_DIR=$(dirname $(readlink -f $0))
VERSION=`grep AppVersion ${SCRIPT_DIR}/../BuildInfo.properties | awk -F'=' '{print $2}'`
# Kill old instance
docker rm -f cag-demo-api-${INSTANCE} || /bin/true
# Start a new one
docker run -d -e "PIPELINE_ENV=${PIPELINE_ENV}" --name cag-demo-api-${INSTANCE} -p ${PORT_PREFIX}${EPORT}:${PORT} -p ${PORT_PREFIX}${M_PORT}:${M_PORT} cag-demo-api:$VERSION
# Sleep some time before checking that it's working
timeout 3m bash runsmoketestuntilkilled.sh

