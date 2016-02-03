#!/bin/bash

#
# Test REST endpoint GET /echo
#

RESPONSE=`curl -s -f ${API_BASE_URL}/echo?s=hej`
if [ "$RESPONSE" != "Received string: hej" ]
then
    echo "Test fail"
    exit 1
else
    echo "Test ok"
fi

# Compact test:
# if ! `curl -s -f ${API_BASE_URL}/echo?s=hej | grep 'hej' >/dev/null`
#
# Compare exact string:
# if [ "$RESPONSE" != "Received string: hej" ]
#
# Compare string contains:
# if [[ $RESPONSE != *"hej"* ]]
