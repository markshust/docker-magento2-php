# Versions

- [`7.0-fpm`, `latest` (_7.0/fpm/Dockerfile_)](https://github.com/mageinferno/docker-magento2-php/blob/master/7.0/fpm/Dockerfile)
- [`5.6-fpm` (_5.6/fpm/Dockerfile_)](https://github.com/mageinferno/docker-magento2-php/blob/master/5.6/fpm/Dockerfile)

# Description

This image is built from the official [`php`](https://hub.docker.com/_/php/) repository and contains PHP configurations for Magento 2.

# What's in this image?

This image installs the following base packages:

- `composer`
- `php-fpm`

This image also installs the following PHP extensions, which are the minimally required extensions to install and run Magento 2:

- `gd`
- `intl`
- `mbstring`
- `mcrypt`
- `pdo_mysql`
- `xsl`
- `zip`

A new `magento` user is created that belongs to the web server group, and the following lines are included to run proper filesystem permissions when using ['Boot2Docker'](http://boot2docker.io/) or ['Dinghy'](https://github.com/codekitchen/dinghy) on OS X:

`usermod -u 501 magento && usermod -u 1000 magento`

# How to use this image?

This image can run one-off PHP commands, such as:

`docker run --rm --name php-test mageinferno/magento2-php echo "Hello world"`

By default, you should place application code in `/src`, or attach a volume at that location. When doing so, you can then run Magento-specific commands such as the Magento CLI tool:

`docker run --rm --name mysite -v /Users/username/Sites/mysite/src:/src mageinferno/magento2-php ./bin/magento`

This image can also be ran as a container attached to an Nginx or Apache server. Please see <a href="https://github.com/mageinferno/magento2-docker-compose" target="_blank">https://github.com/mageinferno/magento2-docker-compose</a> for more detailed instructions and an example development environment using Docker Compose.
