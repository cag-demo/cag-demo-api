#!/usr/bin/env bash
APP_ENV=$1
docker build -t cag-demo-api-${APP_ENV} target/go/docker
docker rm -f cag-demo-api-${APP_ENV} &> /dev/null || true
docker run \
    -e SE_CAGLABS_CODENIGHT_ENVIRONMENT=APP_ENV \
    -d --name cag-demo-api-${APP_ENV} \
    -p 10110:8080 \
    cag-demo-api-${APP_ENV}