#!/usr/bin/env bash
PIPELINE_ENV=$1
cd ../target/go/docker

docker build -t cag-demo-api .
docker rm -f cag-demo-api &> /dev/null || true
docker run \
    -e SE_CAGLABS_CODENIGHT_ENVIRONMENT=${PIPELINE_ENV} \
    -d --name cag-demo-api \
    -p 10110:8080 \
    cag-demo-api

# Run manually:
# docker run -it --rm cag-demo-api
