FROM ubuntu:xenial

ADD scripts/install_aws_cli.sh /opt/scripts/
ADD scripts/install_azure_cli.sh /opt/scripts/
ADD semver.sh /opt/scripts/

RUN apt-get update && \
    apt-get install -y unzip wget git gnupg2 curl vim-common lsb-release apt-transport-https apt-utils python3-pip jq && \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    pip3 install --upgrade pip

RUN /opt/scripts/semver.sh

# Install AWS CLI
RUN /opt/scripts/install_aws_cli.sh

# Install BOSH CLI v2 and dependencies
RUN apt-get update && \
    apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 && \
    wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.48-linux-amd64 && \
    chmod +x bosh-cli-* && \
    mv bosh-cli-* /usr/local/bin/bosh

RUN gem install cf-uaac

# Install cf-cli
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - && \
    echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list && \
    apt-get update && \
    apt-get install -y cf-cli

# Install Google Cloud CLI
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && apt-get install -y google-cloud-sdk

# Install Azure CLI
RUN /opt/scripts/install_azure_cli.sh

# get and configure terraform
RUN wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip && \
    unzip terraform_0.11.3_linux_amd64.zip && \
    chmod a+x terraform && \
    mv terraform /usr/local/bin/terraform && \
    rm terraform_0.11.3_linux_amd64.zip

# install credhub and vault
RUN wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.5.3/credhub-linux-1.5.3.tgz && \
    tar -xvf credhub-linux-1.5.3.tgz && \
    mv credhub /usr/local/bin/credhub && \
    rm credhub-linux-1.5.3.tgz

RUN wget https://releases.hashicorp.com/vault/0.9.3/vault_0.9.3_linux_amd64.zip && \
    unzip vault_0.9.3_linux_amd64.zip && \
    mv vault /usr/local/bin/vault && \
    rm vault_0.9.3_linux_amd64.zip

# install fly cli
RUN wget https://github.com/concourse/concourse/releases/download/v3.8.0/fly_linux_amd64 && \
    chmod +x fly_linux_amd64 && \
    mv fly_linux_amd64 /usr/local/bin/fly

# install yq
RUN wget https://github.com/mikefarah/yq/releases/download/1.14.0/yq_linux_amd64 && \
    chmod +x yq_linux_amd64 && \
    mv yq_linux_amd64 /usr/local/bin/yq

# install om-linux tool
RUN wget https://github.com/pivotal-cf/om/releases/download/0.29.0/om-linux && \
    chmod +x om-linux && \
    mv om-linux /usr/local/bin/ && \
    ln -s /usr/local/bin/om-linux /usr/local/bin/om

# install bbl
RUN wget https://github.com/cloudfoundry/bosh-bootloader/releases/download/v6.1.0/bbl-v6.1.0_linux_x86-64 && \
    chmod +x bbl-v6.1.0_linux_x86-64 && \
    mv bbl-v6.1.0_linux_x86-64 /usr/local/bin/bbl

# install cf-mgmt-config
RUN wget https://github.com/pivotalservices/cf-mgmt/releases/download/v0.0.81/cf-mgmt-config-linux && \
    chmod +x cf-mgmt-config-linux && \
    mv cf-mgmt-config-linux /usr/local/bin/cf-mgmt-config
