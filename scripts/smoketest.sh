#!/bin/bash

#
# Run smoke test: Call REST endpoint GET /version and verify that the response string
# contains the text "version".
#

if ! `curl -s -f ${API_BASE_URL}/version | grep 'version' >/dev/null`
then
    echo "smoketest.sh failed (tried endpoint /version)"
    exit 1
fi
