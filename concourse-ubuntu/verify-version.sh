#!/bin/bash
#set -e

# Set the following variable to match the name of the version file in git
VERSION_FILE=concourse-ubuntu-version

cp dockerversion/$VERSION_FILE version-git
cp /version .

diff=$(diff version version-git)
if [[ $? != 0 ]]; then
  echo "
  Bad news: The semver version embedded in the docker image does not match the version in git.
  Current version of this Docker image: $(cat version)
  Docker image version in github: $(cat version-git)
  Check the build and try again.
  "
  exit 1
else
  echo "
  The semver version embedded in the docker image matches the version in git.
  Current version is: $(cat version)
  "
fi
