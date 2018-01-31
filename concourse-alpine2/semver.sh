#!/bin/bash

git clone https://github.com/thaddeusa/docker-images.git
cd docker-images
git checkout version
cp concourse-alpine2-version ../version
cd ..
rm -rf docker-images
