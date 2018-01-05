FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y unzip wget git
RUN apt-get install -y build-essential ruby ruby-dev libxml2-dev libsqlite3-dev libxslt1-dev libpq-dev libmysqlclient-dev zlib1g-dev

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

RUN wget -O wget -O omg https://github.com/enaml-ops/omg-cli/releases/download/v1.0.7/omg-linux
RUN chmod a+x omg
RUN ln omg /usr/local/bin/omg

RUN wget -O aws-cloudconfigplugin https://github.com/enaml-ops/omg-cli/releases/download/v1.0.7/aws-cloudconfigplugin-linux
RUN chmod a+x aws-cloudconfigplugin
RUN omg register-plugin --type cloudconfig --pluginpath aws-cloudconfigplugin

# install concourse product plugin
RUN wget -O concourse-plugin https://github.com/enaml-ops/omg-product-bundle/releases/download/v1.0.8/concourse-plugin-linux
RUN chmod a+x concourse-plugin
RUN omg register-plugin --type product --pluginpath concourse-plugin

RUN wget -O cloudfoundry-plugin  https://github.com/enaml-ops/omg-product-bundle/releases/download/v1.0.8/cloudfoundry-plugin-linux
RUN omg register-plugin --type product --pluginpath cloudfoundry-plugin
