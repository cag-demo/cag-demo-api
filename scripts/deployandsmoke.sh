#!/bin/bash

#
# Deploy app and verify that the deployment works by running a smoke test.
# This script is called by the pipeline in all environments.
#
# Environment variables:
# PIPELINE_ENV: pipeline environment name (autosmall, autolarge, uat prod)
#
#
# Arguments:
# Port prefix: (empty, 0, 1 or two)
#
# The port prefix can be used to support prefixing ports in different environments which
# enables deploying different versions of the app configured for different environments
# on the same host.
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
docker rm -f cag-demo-api-${INSTANCE} || /bin/true

# Start a new instance
docker run -d -e "PIPELINE_ENV=${PIPELINE_ENV}" \
    --name cag-demo-api-${INSTANCE} \
    -p ${PORT_PREFIX}${PORT}:${PORT} \
    cag-demo-api:$VERSION

# Run smoke test
timeout 3m bash runsmoketestuntilkilled.sh
