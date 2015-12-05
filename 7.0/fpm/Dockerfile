FROM php:7.0.0-fpm
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libxslt1-dev \
    git \
    vim

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  gd \
  intl \
  mbstring \
  mcrypt \
  pdo_mysql \
  xsl \
  zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - \ 
  && apt-get install -y nodejs

RUN npm install -g grunt-cli

COPY php.ini /usr/local/etc/php/
COPY php-fpm.conf /usr/local/etc/

RUN usermod -u 501 www-data

WORKDIR /src
