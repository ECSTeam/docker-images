#!/bin/bash
#set -e

echo -e "running this next..."
echo -e "cp dockerversion/concourse-alpine2-version version-git"
echo -e "above ran successfully"
echo -e "now this..."
cp dockerversion/concourse-alpine2-version version-git
echo -e "looks good"
echo -e "now this one..."
echo -e "cp /version ."
cp /version .
echo -e "yeah!"

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
