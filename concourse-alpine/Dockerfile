FROM alpine:3.7

RUN apk --no-cache add tar sudo bash wget curl python gcc python-dev jq openssh make g++ musl-dev groff less openssl openssl-dev py-pip py3-pip ruby ruby-dev python3 libffi-dev ca-certificates git linux-headers dpkg

RUN python3 -m pip install --upgrade pip
ADD semver.sh /opt/scripts/

RUN /opt/scripts/semver.sh

ARG GLIBC_VER=2.32-r0

RUN curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
    && apk add --no-cache \
        glibc-${GLIBC_VER}.apk \
        glibc-bin-${GLIBC_VER}.apk \
    && curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
    && aws/install \
    && rm -rf \
        awscliv2.zip \
        aws \
        /usr/local/aws-cli/v2/*/dist/aws_completer \
        /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
        /usr/local/aws-cli/v2/*/dist/awscli/examples \
    && apk --no-cache del \
    && rm glibc-${GLIBC_VER}.apk \
    && rm glibc-bin-${GLIBC_VER}.apk \
    && rm -rf /var/cache/apk/*

ARG BOSH_CLI_VR=6.4.1

RUN wget https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VR}/bosh-cli-${BOSH_CLI_VR}-linux-amd64 && \
    chmod +x bosh-cli-* && \
    mv bosh-cli-* /usr/local/bin/bosh

ARG TERRAFORM_VR=0.14.5    

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VR}/terraform_${TERRAFORM_VR}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VR}_linux_amd64.zip && \
    chmod a+x terraform && \
    mv terraform /usr/local/bin/terraform && \
    rm terraform_${TERRAFORM_VR}_linux_amd64.zip

ARG GOOGLE_SDK_VR=325.0.0
RUN set -x && \
    curl -sSL -o /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_SDK_VR}-linux-x86_64.tar.gz && \
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

ARG AZURE_CLI_VERSION=2.18.0

RUN /azure-cli/bin/python -m pip --no-cache-dir install azure-cli==${AZURE_CLI_VERSION}
RUN echo -e "#!/usr/bin/env sh \n\n /azure-cli/bin/python -m azure.cli "$@"" > /usr/bin/az
RUN chmod +x  /usr/bin/az

RUN /azure-cli/bin/python -m pip install --upgrade pip

ARG CREDHUB_VR=2.9.0

RUN wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_VR}/credhub-linux-${CREDHUB_VR}.tgz && \
    tar -xzf credhub-linux-${CREDHUB_VR}.tgz && \
    rm credhub-linux-${CREDHUB_VR}.tgz && \
    mv credhub /usr/local/bin/credhub

ARG VAULT_VR=1.6.1    

RUN wget https://releases.hashicorp.com/vault/${VAULT_VR}/vault_${VAULT_VR}_linux_amd64.zip && \
    unzip vault_${VAULT_VR}_linux_amd64.zip && \
    rm vault_${VAULT_VR}_linux_amd64.zip && \
    mv vault /usr/local/bin/vault


ARG CONCOURSE_VR=6.7.4

RUN wget https://github.com/concourse/concourse/releases/download/v${CONCOURSE_VR}/fly-${CONCOURSE_VR}-linux-amd64.tgz && \
    chmod a+x fly-${CONCOURSE_VR}-linux-amd64.tgz && \
    mv fly-${CONCOURSE_VR}-linux-amd64.tgz /usr/local/bin/fly

RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx && \
    rm LICENSE && \
    rm NOTICE && \
    mv cf /usr/local/bin/cf

ARG JQ_VR=1.6

RUN wget https://github.com/stedolan/jq/releases/download/jq-${JQ_VR}/jq-linux64 && \
    chmod +x jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq

ARG YQ_VR=4.4.1

RUN wget https://github.com/mikefarah/yq/releases/download/v${YQ_VR}/yq_linux_amd64 && \
    chmod +x yq_linux_amd64 && \
    mv yq_linux_amd64 /usr/local/bin/yq

ARG PIVOTAL_CF_VR=7.2.0

RUN wget https://github.com/pivotal-cf/om/releases/download/${PIVOTAL_CF_VR}/om-linux-${PIVOTAL_CF_VR} && \
    chmod +x om-linux-${PIVOTAL_CF_VR} && \
    mv om-linux-${PIVOTAL_CF_VR} /usr/local/bin/om-linux && \
    ln -s /usr/local/bin/om-linux /usr/local/bin/om

ARG BBR_VR=8.4.9

RUN wget https://github.com/cloudfoundry/bosh-bootloader/releases/download/v${BBR_VR}/bbl-v${BBR_VR}_linux_x86-64 && \
    chmod +x bbl-v${BBR_VR}_linux_x86-64 && \
    mv bbl-v${BBR_VR}_linux_x86-64 /usr/local/bin/bbl

ARG CF_MGMT_VR=1.0.48

RUN wget https://github.com/vmwarepivotallabs/cf-mgmt/releases/download/v${CF_MGMT_VR}/cf-mgmt-config-linux && \
    chmod +x cf-mgmt-config-linux && \
    mv cf-mgmt-config-linux /usr/local/bin/cf-mgmt-config

RUN sudo gem install bundler --no-rdoc --no-ri
RUN gem update --system --no-document
RUN gem install json --no-document
RUN gem install cf-uaac --no-document

