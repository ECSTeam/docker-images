#!/bin/bash
#set -e

echo -e "cp dockerversion/concourse-alpine2-version version-git"
cp dockerversion/concourse-alpine2-version version-git
echo -e "cp /version ."
cp /version .

diff=$(diff version version-git)
if [[ $? != 0 ]]; then
  echo "Bad news: There is a difference."
  echo "Current version of this Docker image: $(cat version)"
  echo "Docker image version in github: $(cat version-git)"
  echo "Now I need to do something drastic..."
#  exit 1
  ## take some significant action here!!
else
  echo "no difference"
fi
