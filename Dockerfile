FROM php:7.2-fpm

WORKDIR /var/www

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  nginx \
  ruby-full \
  default-mysql-client \
  libpng-dev \
  libjpeg62-turbo-dev \
  libfreetype6-dev \
  locales \
  zip \
  jpegoptim optipng pngquant gifsicle \
  vim \
  unzip \
  git \
  curl && \
  apt-get clean &&\
  rm -f /etc/nginx/sites-enabled/default &&\
  rm -rf /var/lib/apt/lists/* &&\
  gem install foreman
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl gd bcmath
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
