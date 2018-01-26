FROM alpine:3.7

RUN apk --no-cache add bash

ADD semver.sh /opt/scripts/

RUN chmod +x /opt/scripts/semver.sh
RUN /opt/scripts/semver.sh
