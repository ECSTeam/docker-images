FROM alpine:3.7

RUN apk --no-cache add tar sudo bash wget curl python gcc python-dev jq openssh make g++ musl-dev groff less openssl openssl-dev py-pip py3-pip ruby ruby-dev python3 libffi-dev ca-certificates libc6-compat git linux-headers

RUN pip install --upgrade pip
ADD semver.sh /opt/scripts/

RUN /opt/scripts/semver.sh

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscliv2.zip

RUN wget https://github.com/cloudfoundry/bosh-cli/releases/download/v6.3.0/bosh-cli-6.3.0-linux-amd64 && \
    chmod +x bosh-cli-* && \
    mv bosh-cli-* /usr/local/bin/bosh

RUN wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip && \
    unzip terraform_0.11.14_linux_amd64.zip && \
    chmod a+x terraform && \
    mv terraform /usr/local/bin/terraform && \
    rm terraform_0.11.14_linux_amd64.zip

RUN set -x && \
    curl -sSL -o /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-297.0.1-linux-x86_64.tar.gz && \
    mkdir -p /usr/src/google-cloud-sdk && \
    tar -xzf /tmp/google-cloud-sdk.tar.gz -C /usr/src/google-cloud-sdk --strip-components 1 && \
    rm /tmp/google-cloud-sdk.tar.gz && \
    (cd /usr/src/google-cloud-sdk && \
		./install.sh)

WORKDIR /root
ENV PATH $PATH:/usr/src/google-cloud-sdk/bin

RUN apk --update --no-cache add postgresql-client postgresql

RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev make python3-dev

RUN pip3 install virtualenv &&\
    python3 -m virtualenv /azure-cli

ARG AZURE_CLI_VERSION=2.7.0

RUN /azure-cli/bin/python -m pip --no-cache-dir install azure-cli==${AZURE_CLI_VERSION}
RUN echo -e "#!/usr/bin/env sh \n\n /azure-cli/bin/python -m azure.cli "$@"" > /usr/bin/az
RUN chmod +x  /usr/bin/az

RUN gem install cf-uaac --no-document

RUN wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-linux-2.7.0.tgz && \
    tar -xzf credhub-linux-2.7.0.tgz && \
    rm credhub-linux-2.7.0.tgz && \
    mv credhub /usr/local/bin/credhub

RUN wget https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_linux_amd64.zip && \
    unzip vault_1.4.2_linux_amd64.zip && \
    rm vault_1.4.2_linux_amd64.zip && \
    mv vault /usr/local/bin/vault

RUN wget https://github.com/concourse/concourse/releases/download/v6.3.0/fly-6.3.0-linux-amd64.tgz && \
    chmod a+x fly-6.3.0-linux-amd64.tgz && \
    mv fly-6.3.0-linux-amd64.tgz /usr/local/bin/fly

RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx && \
    rm LICENSE && \
    rm NOTICE && \
    mv cf /usr/local/bin/cf

RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    chmod +x jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq

RUN wget https://github.com/mikefarah/yq/releases/download/3.3.2/yq_linux_amd64 && \
    chmod +x yq_linux_amd64 && \
    mv yq_linux_amd64 /usr/local/bin/yq

RUN wget https://github.com/pivotal-cf/om/releases/download/5.0.0/om-linux-5.0.0 && \
    chmod +x om-linux-5.0.0 && \
    mv om-linux-5.0.0 /usr/local/bin/om-linux && \
    ln -s /usr/local/bin/om-linux /usr/local/bin/om

RUN wget https://github.com/cloudfoundry/bosh-bootloader/releases/download/v8.4.0/bbl-v8.4.0_linux_x86-64 && \
    chmod +x bbl-v8.4.0_linux_x86-64 && \
    mv bbl-v8.4.0_linux_x86-64 /usr/local/bin/bbl

RUN wget https://github.com/vmwarepivotallabs/cf-mgmt/releases/download/v1.0.45/cf-mgmt-config-linux && \
    chmod +x cf-mgmt-config-linux && \
    mv cf-mgmt-config-linux /usr/local/bin/cf-mgmt-config