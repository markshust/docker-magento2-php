FROM php:7.0.2-fpm
MAINTAINER Dmitry Schegolihin <d.shegolihin@gmail.com>

RUN apt-get update \
  && apt-get install -y \
    git \
    cron \
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

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.0.0-alpha11

RUN echo "*/1 * * * * su -c \"/usr/local/bin/php /src/update/cron.php\" -s /bin/sh www-data" | crontab - \
  && (crontab -l ; echo "*/1 * * * * su -c \"/usr/local/bin/php /src/bin/magento-php cron:run\" -s /bin/sh www-data") | crontab - \
  && (crontab -l ; echo "*/1 * * * * su -c \"/usr/local/bin/php /src/bin/magento-php setup:cron:run\" -s /bin/sh www-data") | crontab -

RUN usermod -u 502 www-data

ENV PHP_MEMORY_LIMIT 2G
ENV PHP_PORT 9000
ENV PHP_PM dynamic
ENV PHP_PM_MAX_CHILDREN 10
ENV PHP_PM_START_SERVERS 4
ENV PHP_PM_MIN_SPARE_SERVERS 2
ENV PHP_PM_MAX_SPARE_SERVERS 6
ENV APP_MAGE_MODE default

COPY conf/php.ini /usr/local/etc/php/
COPY conf/php-fpm.conf /usr/local/etc/
COPY bin/* /usr/local/bin/ 

WORKDIR /src

CMD ["/usr/local/bin/start"]
