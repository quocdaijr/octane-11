FROM php:8.3-alpine
MAINTAINER NguyenQuocDai <quocdaijr@gmail.com>

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN install-php-extensions pcntl sockets

COPY ./ /var/www/html
COPY ./.env.frankenphp /var/www/html/.env
WORKDIR /var/www/html

RUN composer install --no-dev --no-interaction --no-autoloader --no-scripts --prefer-dist
RUN composer dump-autoload --optimize
RUN chmod -R 777 ./storage ./bootstrap/cache

RUN php artisan octane:install --server=frankenphp