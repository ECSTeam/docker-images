FROM alpine:3.7

RUN apk --no-cache add bash wget curl python gcc python-dev jq openssh make g++ musl-dev groff less openssl openssl-dev py-pip py3-pip ruby ruby-dev python3 libffi-dev ca-certificates libc6-compat git

ADD semver.sh /opt/scripts/

RUN /opt/scripts/semver.sh

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip

RUN wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.45-linux-amd64 && \
    chmod +x bosh-cli-* && \
    mv bosh-cli-* /usr/local/bin/bosh

RUN wget https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_linux_amd64.zip && \
    unzip terraform_0.11.2_linux_amd64.zip && \
    chmod a+x terraform && \
    mv terraform /usr/local/bin/terraform && \
    rm terraform_0.11.2_linux_amd64.zip

RUN set -x && \
    curl -sSL -o /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
    mkdir -p /usr/src/google-cloud-sdk && \
    tar -xzf /tmp/google-cloud-sdk.tar.gz -C /usr/src/google-cloud-sdk --strip-components 1 && \
    rm /tmp/google-cloud-sdk.tar.gz && \
    (cd /usr/src/google-cloud-sdk && \
		./install.sh)

WORKDIR /root
ENV PATH $PATH:/usr/src/google-cloud-sdk/bin

RUN pip install azure-cli && \
    gem install cf-uaac --no-document

RUN wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.5.3/credhub-linux-1.5.3.tgz && \
    tar -xzf credhub-linux-1.5.3.tgz && \
    rm credhub-linux-1.5.3.tgz && \
    mv credhub /usr/local/bin/credhub

RUN wget https://releases.hashicorp.com/vault/0.9.3/vault_0.9.3_linux_amd64.zip && \
    unzip vault_0.9.3_linux_amd64.zip && \
    rm vault_0.9.3_linux_amd64.zip && \
    mv vault /usr/local/bin/vault

RUN wget https://github.com/concourse/concourse/releases/download/v3.8.0/fly_linux_amd64 && \
    chmod a+x fly_linux_amd64 && \
    mv fly_linux_amd64 /usr/local/bin/fly

RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx && \
    rm LICENSE && \
    rm NOTICE && \
    mv cf /usr/local/bin/cf
