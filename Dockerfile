FROM php:7.4-fpm

RUN apt-get update && apt-get install -y supervisor zip imagemagick nginx \
    libpng-dev libsqlite3-dev libxml2-dev libjpeg62-turbo-dev libfreetype6-dev \
    libzip-dev libc-client-dev libkrb5-dev unzip --no-install-recommends \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install bcmath exif gd \
    intl zip imap mysqli pdo_mysql \
    soap sockets pcntl

RUN echo '' | pecl install -o -f redis msgpack \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis msgpack

COPY  nginx.conf /etc/nginx/nginx.conf
COPY  php.ini /usr/local/etc/php/
COPY  supervisord.conf /etc/supervisor/supervisord.conf

RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chown -R www-data:www-data /var/www/html
WORKDIR /var/www/html
EXPOSE 80
EXPOSE 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]