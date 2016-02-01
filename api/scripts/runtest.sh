#!/bin/bash

# Run tests on application.
# All script files *.sh in the directory tests are run.

export INSTANCE=${PIPELINE_ENV}
export PORT_PREFIX=$1
export PORT=8080

set -e

for f in ../tests/${INSTANCE}/*.sh
do
    echo "Processing $f file ..."
    bash $f
    echo "Done with $f"
done

