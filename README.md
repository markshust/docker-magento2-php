# Versions

- [`5.6.16-fpm-1` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-php/tree/5.6.16-fpm-1/Dockerfile)
- [`7.0.1-fpm-2` (_Dockerfile_)](https://github.com/mageinferno/docker-magento2-php/tree/7.0.1-fpm-2/Dockerfile)

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

# How to use this image?

This image will work out-of-the-box with Linux-based systems.

To use this image on other systems for local development, create a Dockerfile with anything specific to your local development platform.

For example, if using [Dinghy](https://github.com/codekitchen/dinghy) on OS X, use:

```
FROM mageinferno/magento2-php:[TAG]
RUN usermod -u 501 magento
```

Then build your custom image:

```
docker build -t myname/php .
```

# Variables

The following variables may be set to control the PHP environment:

- `PHP_MEMORY_LIMIT`: (default `2048M`) Set the memory_limit of php.ini
- `PHP_PORT`: (default: `9000`) Set a custom PHP port
- `PHP_PM`: (default `dynamic`) Set the process manager
- `PHP_PM_MAX_CHILDREN`: (default: `10`) Set the max number of children processes
- `PHP_PM_START_SERVERS`: (default: `4`) Set the default number of servers to start at runtime
- `PHP_PM_MIN_SPARE_SERVERS`: (default `2`) Set the minumum number of spare servers
- `PHP_PM_MAX_SPARE_SERVERS`: (default: `6`) Set the maximum number of spare servers
- `APP_MAGE_MODE`: (default: `default`) Set the MAGE_MODE

# One-off containers

This image can run one-off PHP commands, such as:

`docker run --rm --name php-test mageinferno/magento2-php echo "Hello world"`

By default, you should place application code in `/src`, or attach a volume at that location. When doing so, you can then run Magento-specific commands such as the Magento CLI tool:

`docker run --rm --name mysite -v /Users/username/Sites/mysite/src:/src mageinferno/magento2-php ./bin/magento`

# Docker Compose

Please see [https://github.com/mageinferno/magento2-docker-compose](https://github.com/mageinferno/magento2-docker-compose) for more detailed instructions and an example development environment using Docker Compose.
