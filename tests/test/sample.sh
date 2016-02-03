#!/bin/bash
echo "Running sample.sh in environment test"

# Nice to have bash stuff.
#
# Compact test:
# if ! `curl -s -f ${API_BASE_URL}/echo?message=Hello+world | grep 'Hello world' >/dev/null`
#
# Compare exact string:
# if [ "$RESPONSE" != "Hello world" ]
#
# Compare string contains:
# if [[ $RESPONSE != *"world"* ]]
