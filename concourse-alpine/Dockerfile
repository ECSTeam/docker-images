FROM alpine:3.5
## ^^ update to newer alpine?
## fewer RUN commands (like ubuntu)?

RUN apk update
RUN apk add bash wget curl jq
RUN apk add openssh

RUN apk --update add ruby ruby-dev gcc make g++ musl-dev
RUN gem install bosh_cli --no-ri --no-rdoc
RUN gem install json --no-ri --no-rdoc
#RUN gem install cf-uaac --no-ri --no-rdoc

## test bosh 2
## add new TF (w cleanup)

COPY om-alpine om-alpine
COPY terraform terraform
#COPY pcf-metadata pcf-metadata
COPY bosh bosh

# find better way and/or upgrade to pip/python3
RUN mkdir -p /aws
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN pip install --upgrade pip

#remove tile-gen and s3cmd?
RUN pip install tile-generator
RUN pip install s3cmd


RUN apk add openssl

# remove this?? possibly just for pcf-tile-version tool for Sonic
RUN apk add perl
RUN apk add perl-json

#look into this
#RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*
