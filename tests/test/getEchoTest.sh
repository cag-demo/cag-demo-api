#!/bin/bash
#
# Test REST endpoint GET /echo
#
RESPONSE=`curl -s -f -G ${API_BASE_URL}/echo -d message=Hello+world`
if [ "$RESPONSE" != "Hello world" ]
then
    echo "fail"
    exit 1
else
    echo "ok"
fi

# -d conversion=upperCase