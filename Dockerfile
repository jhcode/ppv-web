FROM wordpress:php7.0-fpm
LABEL Maintainer BABAJIDE Hassan <jide2002003@gmail.com>

RUN apt update && apt install -y wget
RUN wget -O - https://download.newrelic.com/548C16BF.gpg | apt-key add - \
        &&  sh -c 'echo "deb http://apt.newrelic.com/debian/ newrelic non-free" \
           > /etc/apt/sources.list.d/newrelic.list'

RUN apt update && apt install -y git zip gettext libpng-dev newrelic-php5
RUN docker-php-ext-install pdo pdo_mysql gd

RUN newrelic-install install
COPY scripts/newrelic.ini /usr/local/etc/php/conf.d/
COPY conf/php.ini /usr/local/etc/php/conf.d/

WORKDIR /var/www/html/ppv-web

COPY wp-config.php /usr/src/wordpress/
COPY scripts/start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 9000

ENTRYPOINT /start.sh
