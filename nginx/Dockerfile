FROM nginx:1.13.5
LABEL Maintainer Mettalloids Developers <devops@mettalloids.com>

COPY conf/ /etc/nginx/conf.d/
RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html/picogauge-web

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
