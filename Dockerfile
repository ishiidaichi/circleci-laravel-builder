 
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM circleci/php:7.1-node-browsers

MAINTAINER Daichi Ishii <me@ishiidaichi.com>

USER root
RUN apt update && sudo apt install zlib1g-dev libsqlite3-dev libpng-dev pkg-config libmagickwand-dev
RUN docker-php-ext-install zip gd pcntl
RUN pecl install imagick
RUN docker-php-ext-enable imagick


CMD ["/bin/bash"]
