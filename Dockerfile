 
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM circleci/php:7.1-stretch-node-browsers

MAINTAINER Daichi Ishii <me@ishiidaichi.com>

USER root


RUN apt install lsb-release
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt update -y && apt install google-cloud-sdk -y

RUN apt install zlib1g-dev libsqlite3-dev libpng-dev pkg-config libmagickwand-dev python python-pip libssl-dev
RUN docker-php-ext-install zip gd pcntl pdo_mysql exif sockets
RUN pecl install imagick mongodb
RUN docker-php-ext-enable imagick mongodb
RUN pip install awscli awsebcli

RUN apt install jq
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli

RUN set -x
RUN curl -L -o /tmp/docker-17.03.0-ce.tgz https://get.docker.com/builds/Linux/x86_64/docker-17.03.0-ce.tgz
RUN tar -xz -C /tmp -f /tmp/docker-17.03.0-ce.tgz
RUN mv /tmp/docker/* /usr/bin

RUN rm -rf /var/www/html


CMD ["/bin/bash"]
