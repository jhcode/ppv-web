#!/bin/bash

# Copy files to /var/www/html directory
cp -R /usr/src/wordpress/* /var/www/html/ppv-web/

# Assign ownership of files to a user Nginx has access to.
chown -R www-data:www-data /var/www/html/ppv-web

# Start PHP-FPM
php-fpm
