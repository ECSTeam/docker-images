#!/bin/bash

PK_STRING=$1

# remove "-----BEGIN RSA PRIVATE KEY-----" from the beginning
PK_STRING=${PK_STRING#-----*-----}
# remove "-----END RSA PRIVATE KEY-----" from the end
PK_STRING=${PK_STRING%-----*-----}

echo "-----BEGIN RSA PRIVATE KEY-----" > bosh.pem
BOSH_PEM_LINES=(${PK_STRING})
for lines in ${BOSH_PEM_LINES[@]}
do
    echo $lines >> bosh.pem
done
echo "-----END RSA PRIVATE KEY-----" >> bosh.pem

