FROM php:7.1-apache

# update and install zip extension dependency
RUN apt-get update \
    && apt-get install -y zlib1g-dev

# cs-cart extension required
RUN docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && a2enmod rewrite