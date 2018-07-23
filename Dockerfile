 
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM circleci/php:7.1-node-browsers

MAINTAINER Daichi Ishii <me@ishiidaichi.com>

USER root

RUN apt update
RUN apt install zlib1g-dev libsqlite3-dev libpng-dev pkg-config libmagickwand-dev python python-pip
RUN docker-php-ext-install zip gd pcntl pdo_mysql
RUN pecl install imagick
RUN docker-php-ext-enable imagick
RUN pip install awscli awsebcli

RUN apt install jq
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli

RUN set -x
RUN VER="17.03.0-ce"
RUN curl -L -o /tmp/docker-$VER.tgz https://get.docker.com/builds/Linux/x86_64/docker-$VER.tgz
RUN tar -xz -C /tmp -f /tmp/docker-$VER.tgz
RUN mv /tmp/docker/* /usr/bin


CMD ["/bin/bash"]
