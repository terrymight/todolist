FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

WORKDIR /var/www
COPY . .
RUN chown -R www-data:www-data /var/www
RUN composer install --optimize-autoloader --no-dev

CMD ["php-fpm"]