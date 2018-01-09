#!/bin/bash

array=(aws git az gcloud terraform)
for i in "${array[@]}"
do
  if [[ -z $(command -v $i 2>/dev/null) ]]; then
    echo >&2 "Sorry, $i seems to be missing."
    exit 1
  fi
done

echo "Yay! Specified commands appear to be present."
