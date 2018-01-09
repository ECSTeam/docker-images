FROM ubuntu:xenial

ADD scripts/install_aws_cli.sh /opt/scripts/
ADD scripts/install_azure_cli.sh /opt/scripts/

RUN apt-get update && \
    apt-get install -y unzip wget git gnupg2 curl vim-common lsb-release python3-pip && \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    pip3 install --upgrade pip

# Install AWS CLI
RUN /opt/scripts/install_aws_cli.sh


# Install BOSH CLI v1 and dependencies
RUN apt-get update && \
    apt-get install -y build-essential ruby ruby-dev libxml2-dev libsqlite3-dev libxslt1-dev libpq-dev libmysqlclient-dev zlib1g-dev && \
    gem install bosh_cli --no-ri --no-rdoc && \
    mv /usr/local/bin/bosh /usr/local/bin/bosh1

# Install BOSH CLI v2 and dependencies
RUN apt-get update && \
    apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 && \
    wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.45-linux-amd64 && \
    chmod +x bosh-cli-* && \
    mv bosh-cli-* /usr/local/bin/bosh

# Install Google Cloud CLI
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && apt-get install -y google-cloud-sdk

# Install Azure CLI
RUN /opt/scripts/install_azure_cli.sh

# get and configure terraform
RUN wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip && \
    unzip terraform_0.11.1_linux_amd64.zip && \
    chmod a+x terraform && \
    ln terraform /usr/local/bin/terraform
