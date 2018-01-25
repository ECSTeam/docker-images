#!/bin/bash

git clone https://github.com/thaddeusa/docker-images.git
cd docker-images
git checkout version
cp concourse-skinny-version ../version-git

diff=$(diff version version-git)
if [[ $? != 0 ]]; then
  echo "There is a difference."
  echo "Current version of this Docker image: $(cat version)"
  echo "Docker image version in github: $(cat version-git)"
  ## take some significant action here!!
else
  echo "no difference"
fi
