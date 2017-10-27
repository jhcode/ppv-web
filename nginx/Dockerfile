FROM mofesola/nginx-certbot
LABEL Maintainer Mettalloids Developers <devops@mettalloids.com>

COPY conf/ppv-website.conf /etc/nginx/conf.d/
RUN rm /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh

WORKDIR /var/www/html/ppv-web

RUN usermod -aG www-data nginx

EXPOSE 80 443
ENTRYPOINT /entrypoint.sh
CMD ["nginx", "-g", "daemon off;"]