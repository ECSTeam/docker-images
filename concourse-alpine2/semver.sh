#!/bin/bash

git clone https://github.com/thaddeusa/docker-images.git
cd docker-images
git checkout version
cp concourse-skinny-version ../version
cd ..
rm -rf docker-images
