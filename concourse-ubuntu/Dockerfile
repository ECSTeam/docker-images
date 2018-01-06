FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y unzip wget git gnupg2 curl
RUN apt-get install -y build-essential ruby ruby-dev libxml2-dev libsqlite3-dev libxslt1-dev libpq-dev libmysqlclient-dev zlib1g-dev
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
    sudo apt-get update && sudo apt-get install -y google-cloud-sdk


RUN gem install bosh_cli --no-ri --no-rdoc

# copy bash script to parse the private key in environment variable
COPY createPrivateKey.sh createPrivateKey.sh
RUN chmod a+x createPrivateKey.sh
RUN ln createPrivateKey.sh /usr/local/bin/createPrivateKey.sh

# copy ip functions
COPY ip_functions.sh ip_functions.sh
COPY test_ip_functions.sh test_ip_functions.sh
RUN chmod a+x ip_functions.sh
RUN chmod a+x test_ip_functions.sh

# get and configure terraform
RUN wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip
RUN unzip terraform_0.11.1_linux_amd64.zip
RUN chmod a+x terraform
RUN ln terraform /usr/local/bin/terraform
