 
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


CMD ["/bin/bash"]
