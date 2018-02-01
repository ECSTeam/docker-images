#!/bin/bash

# This script is copied to the docker image and ran as part of the build. It acquires the semver value written to a git repo during the build phase of the pipeline.

# Modify the following variables based on your source git repo
GIT_REPO=https://github.com/ECSTeam/docker-images.git
GIT_REPO_FOLDER=docker-images
GIT_BRANCH=version
VERSION_FILE=concourse-alpine-version

git clone $GIT_REPO
cd $GIT_REPO_FOLDER
git checkout $GIT_BRANCH
cp $VERSION_FILE ../version
cd ..
rm -rf $GIT_REPO_FOLDER
