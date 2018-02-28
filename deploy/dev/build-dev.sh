#!/usr/bin/env bash
envsubst < ~/.aws/credentials.tmpl > ~/.aws/credentials
envsubst < wp-config.php > wp-config2.php && mv wp-config2.php wp-config.php
envsubst < scripts/newrelic.ini > scripts/newrelic2.ini && mv scripts/newrelic2.ini scripts/newrelic.ini
eval $(aws ecr get-login --no-include-email --region ${AWS_REGION})


##############################################
## PECULIAR-WP-APP
##############################################

docker build -t peculiar-wp-dev .
docker tag peculiar-wp-dev:latest 780172389235.dkr.ecr.eu-west-1.amazonaws.com/peculiar-wp-peculiar-wp-dev:latest
docker push 780172389235.dkr.ecr.eu-west-1.amazonaws.com/peculiar-wp-peculiar-wp-dev:latest


##############################################
## NGINX
##############################################

docker build -t peculiar-wp-dev-nginx nginx/.
docker tag peculiar-wp-dev-nginx:latest 780172389235.dkr.ecr.eu-west-1.amazonaws.com/peculiar-wp-peculiar-wp-nginx-dev:latest
docker push 780172389235.dkr.ecr.eu-west-1.amazonaws.com/peculiar-wp-peculiar-wp-nginx-dev:latest
