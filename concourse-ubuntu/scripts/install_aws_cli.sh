#!/bin/bash

wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
unzip awscli-bundle.zip
./awscli-bundle/install -b /usr/local/bin/aws

rm -rf awscli-* /tmp/*

#./awscli-bundle/install -b ~/bin/aws

#echo "export PATH=~/bin:$PATH" >> ~/.profile
#source ~/.profile

#prob won't use this method:
#curl -O https://bootstrap.pypa.io/get-pip.py
#python get-pip.py --user
