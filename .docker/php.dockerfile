FROM php:8.2-fpm-alpine

# Korisnik za non-root operacije. Spriječava da se .log files kreiraju od strane root usera.
RUN addgroup -g 1000 development && adduser -G development -g development -s /bin/sh -D development

# U slučaju da folder ne postoji.
RUN mkdir -p /var/www/html

# Dajemo potpune permisije u /var/www/html "development" korisniku.
RUN chown development:development /var/www/html

# Dependencies za ekstenzije.
RUN apk --no-cache add mysql-client freetype-dev gmp-dev libjpeg-turbo-dev libpng-dev libzip-dev oniguruma-dev zip

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-install pdo pdo_mysql bcmath exif gd gmp mysqli opcache zip

# Dependencies za Browsershot.
RUN apk add --no-cache \
          chromium \
          nss \
          freetype \
          freetype-dev \
          harfbuzz \
          ca-certificates \
          ttf-freefont \
          nodejs \
          npm

USER development
