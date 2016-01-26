#!/bin/bash
INSTANCE=${DOODLE_ENV}
VERSION=${GO_PIPELINE_LABEL}
PORT_PREFIX=$1
set -ex 
docker rm -f codenight-${INSTANCE} || /bin/true
# Is depending on directory name running docker-compose up in!! Ugly!!
docker run -d --name cag-demo-api-${INSTANCE} -p 8080:8080 cag-demo-api:$VERSION


