FROM php:8.2-apache
RUN apt-get update && apt-get install -y --no-install-recommends libpng-dev libjpeg62-turbo-dev libfreetype6-dev libzip-dev libonig-dev libcurl4-openssl-dev && docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install pdo_mysql gd zip mbstring curl opcache && a2enmod rewrite headers && rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html
COPY . /var/www/html/
RUN mkdir -p storage && chown -R www-data:www-data /var/www/html
RUN printf '%s\n' '<Directory /var/www/html>' 'Require all denied' '</Directory>' '<Directory /var/www/html/public>' 'Require all granted' 'Options -Indexes' 'AllowOverride None' 'RewriteEngine On' 'RewriteCond %{REQUEST_FILENAME} !-f' 'RewriteCond %{REQUEST_FILENAME} !-d' 'RewriteRule ^ /index.php [L]' '</Directory>' '<VirtualHost *:80>' 'DocumentRoot /var/www/html/public' '</VirtualHost>' > /etc/apache2/sites-available/000-default.conf
EXPOSE 80
