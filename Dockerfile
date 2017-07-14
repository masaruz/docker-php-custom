FROM php:7.1-apache

# update and install zip extension dependency
RUN apt-get update \
    && apt-get install -y \
    zlib1g-dev \
    libmagickwand-dev --no-install-recommends

# cs-cart extension required
RUN docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && a2enmod rewrite

# install imagine extension
RUN pecl install imagick  \
    && docker-php-ext-enable imagick

# install xdebug
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini