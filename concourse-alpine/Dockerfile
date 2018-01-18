FROM alpine:latest

RUN apk --no-cache add bash wget curl python
#jq openssh ruby ruby-dev ruby-rdoc gcc make g++ musl-dev groff less python python3 py3-pip openssl py2-pip libffi-dev openssl-dev python-dev
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip
RUN wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.45-linux-amd64 && \
    chmod +x bosh-cli-* && \
    mv bosh-cli-* /usr/local/bin/bosh
#RUN gem install cf-uaac
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-185.0.0-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-185.0.0-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-185.0.0-linux-x86_64.tar.gz && \
    echo "export PATH=/google-cloud-sdk/bin:$PATH" >> ~/.profile && \
    source ~/.profile
RUN wget https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_linux_amd64.zip && \
    unzip terraform_0.11.2_linux_amd64.zip && \
    chmod a+x terraform && \
    mv terraform /usr/local/bin/terraform && \
    rm terraform_0.11.2_linux_amd64.zip
#RUN pip install azure-cli
