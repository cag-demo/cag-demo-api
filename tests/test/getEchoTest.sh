#!/bin/bash

#
# Test REST endpoint GET /echo
#

RESPONSE=`curl -s -f ${API_BASE_URL}/echo?message=Hello+world`
if [ "$RESPONSE" != "Hello world" ]
then
    echo "Test fail"
    exit 1
else
    echo "Test ok"
fi

# Compact test:
# if ! `curl -s -f ${API_BASE_URL}/echo?message=Hello+world | grep 'Hello world' >/dev/null`
#
# Compare exact string:
# if [ "$RESPONSE" != "Hello world" ]
#
# Compare string contains:
# if [[ $RESPONSE != *"world"* ]]
