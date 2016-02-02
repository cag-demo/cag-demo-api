#!/usr/bin/env bash
cd target/go/docker
docker build -t cag-demo-api target/go/docker
docker rm -f cag-demo-api &> /dev/null || true
docker run \
    -e SE_CAGLABS_CODENIGHT_ENVIRONMENT=prod \
    -d --name cag-demo-api \
    -p 10110:8080 \
    cag-demo-api