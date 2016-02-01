#!/bin/bash

#
# Run smoke test.
# The application may take some time to start, retry tests forever until succeeded.
# Caller of this script is responsible for timing handling.
#

while `/bin/true`
do
    echo try to run smoketest.sh
    #if `bash smoketest.sh >/dev/null 2>&1`; then break; fi
    if `bash smoketest.sh`; then break; fi
    sleep 3
done
