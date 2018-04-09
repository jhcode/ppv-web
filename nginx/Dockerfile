FROM nginx:1.13.5
LABEL Maintainer BABAJIDE Hassan <jide2002003@gmail.com>

COPY conf/ /etc/nginx/conf.d/
RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html/ppv-web

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
