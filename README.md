# Versions

- [`5.6-fpm`, `latest` (_5.6/fpm/Dockerfile_)](https://github.com/mageinferno/docker-magento2-php/blob/master/5.6/fpm/Dockerfile)
- [`7.0.0RC7-fpm` (_7.0/fpm/Dockerfile_)](https://github.com/mageinferno/docker-magento2-php/blob/master/7.0/fpm/Dockerfile)

# Description

This image is built from the official [`php`](https://hub.docker.com/_/php/) repository and contains PHP configurations for Magento 2.

# What's in this image?

This image installs the following base packages:

- `composer`
- `git`
- `grunt`
- `nodejs`
- `php-fpm`
- `vim`

This image also installs the following PHP extensions, which are the minimally required extensions to install and run Magento 2:

- `gd`
- `intl`
- `mbstring`
- `mcrypt`
- `pdo_mysql`
- `xsl`
- `zip`

The following line is included to run proper filesystem permissions when using ['Dinghy'](https://github.com/codekitchen/dinghy) on OS X.

`RUN usermod -u 501 www-data`

# How to use this image?

This image can run one-off PHP commands, such as:

`docker run --rm --name php-test mageinferno/magento2-php echo "Hello world"`

By default, you should place application code in `/src`, or attach a volume at that location. When doing so, you can then run Magento-specific commands such as the Magento CLI tool:

`docker run --rm --name mysite -v /Users/username/Sites/mysite/src:/src mageinferno/magento2-php ./bin/magento`

This image can also be ran as a container attached to an Nginx or Apache server. Please see <a href="https://github.com/mageinferno/magento2-docker-compose" target="_blank">https://github.com/mageinferno/magento2-docker-compose</a> for more detailed instructions and an example development environment using Docker Compose.
