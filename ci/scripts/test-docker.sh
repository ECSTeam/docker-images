#!/bin/bash

# array defines the commands that this script looks for
# the script will fail if any of these commands don't exist in the docker image
array=(aws git az gcloud terraform)

for i in "${array[@]}"
do
  if [[ -z $(command -v $i 2>/dev/null) ]]; then
    echo >&2 "Sorry, $i seems to be missing."
#    exit 1
  fi
done

echo "Specified commands appear to be present."
