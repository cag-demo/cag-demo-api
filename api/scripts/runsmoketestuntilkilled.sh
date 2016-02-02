#!/bin/bash

#
# Run smoke test.
# The application may take some time to start, retry tests forever until succeeded.
# Caller of this script is responsible for handle timout and stop this script from hanging forever.
#

while `/bin/true`
do
    echo Running smoketest.sh...
    bash smoketest.sh # >/dev/null 2>&1
    if [ $? -eq 0 ]; then break; fi
    sleep 3
done
