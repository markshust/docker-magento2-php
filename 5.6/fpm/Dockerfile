FROM php:5.6-fpm
MAINTAINER Mark Shust <mark.shust@mageinferno.com>

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libxslt1-dev

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

COPY php.ini /usr/local/etc/php/
COPY php-fpm.conf /usr/local/etc/

RUN useradd -p $(openssl passwd -1 magento) magento \
  && adduser magento www-data \
  && usermod -u 501 magento \
  && usermod -u 1000 magento

WORKDIR /src
