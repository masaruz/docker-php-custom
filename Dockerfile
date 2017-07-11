FROM php:7.1-apache

RUN apt-get update \
    && apt-get install -y zlib1g-dev

RUN docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && a2enmod rewrite