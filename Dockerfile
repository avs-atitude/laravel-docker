FROM php:8.1-fpm-alpine

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN apk update --no-cache \
    && apk add \
    icu-dev \
    oniguruma-dev \
    tzdata && \
    docker-php-ext-install intl \
    pcntl \
    pdo_mysql \
    mbstring && \
    rm -rf /var/cache/apk/*


WORKDIR /var/www/html

COPY . .
