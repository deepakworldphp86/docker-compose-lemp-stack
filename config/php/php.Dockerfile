FROM php:7.4-fpm

#ENV COMPOSER_HOME /var/www/.composer

RUN apt-get update && \
    apt-get install -y git zip

RUN curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin \
        --filename=composer --version=1.10.16 && \
        composer global require --optimize-autoloader \
        "fxp/composer-asset-plugin:~1.4.6" \
        "hirak/prestissimo:^0.3.10" && \
        composer global dumpautoload --optimize && \
        composer clear-cache
    
    
    
    
RUN apt-get update && apt-get install -y \
  git \
  gzip \
  libbz2-dev \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
  libsodium-dev \
  libssh2-1-dev \
  libxslt1-dev \
  libzip-dev \
  lsof \
  default-mysql-client \
  vim \
  zip \
  libonig-dev \
  procps \
  libcurl4-openssl-dev \
  curl \
  gcc \
  sudo \
  g++ 


RUN  docker-php-ext-configure gd --with-freetype --with-jpeg


RUN docker-php-ext-install \
  bcmath \
  bz2 \
  calendar \
  exif \
  gd \
  gettext \
  intl \
  mbstring \
  mysqli \
  opcache \
  pcntl \
  pdo_mysql \
  soap \
  sockets \
  sodium \
  sysvmsg \
  sysvsem \
  sysvshm \
  xsl \
  zip
  

RUN pecl channel-update pecl.php.net \
  && pecl install xdebug

RUN docker-php-ext-enable xdebug \
  && sed -i -e 's/^zend_extension/\;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#Swap

RUN rm -rf /var/lib/apt/lists/*

COPY *.sh /var/www/
RUN chown www-data:www-data /var/www/*.sh && chmod +x /var/www/*.sh

USER www-data
   
WORKDIR /var/www/html    
