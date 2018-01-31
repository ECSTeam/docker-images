#!/bin/bash

cp dockerversion/concourse-skinny-version version-git

diff=$(diff version version-git)
if [[ $? != 0 ]]; then
  echo "There is a difference."
  echo "Current version of this Docker image: $(cat version)"
  echo "Docker image version in github: $(cat version-git)"
  exit 1
  ## take some significant action here!!
else
  echo "no difference"
fi
