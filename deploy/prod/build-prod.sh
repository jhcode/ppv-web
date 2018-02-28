#!/usr/bin/env bash
envsubst < ~/.aws/credentials.tmpl > ~/.aws/credentials
envsubst < wp-config.php > wp-config2.php && mv wp-config2.php wp-config.php
envsubst < scripts/newrelic.ini > scripts/newrelic2.ini && mv scripts/newrelic2.ini scripts/newrelic.ini
eval $(aws ecr get-login --no-include-email --region ${AWS_REGION})


##############################################
## PECULIAR-WP-APP
##############################################

docker build -t peculiar-wp-prod .
docker tag peculiar-wp-prod:latest 780172389235.dkr.ecr.eu-west-1.amazonaws.com/peculiar-wp-peculiar-wp-prod:latest
docker push 780172389235.dkr.ecr.eu-west-1.amazonaws.com/peculiar-wp-peculiar-wp-prod:latest


##############################################
## NGINX
##############################################

docker build -t peculiar-wp-prod-nginx nginx/.
docker tag peculiar-wp-prod-nginx:latest 780172389235.dkr.ecr.eu-west-1.amazonaws.com/peculiar-wp-peculiar-wp-nginx-prod:latest
docker push 780172389235.dkr.ecr.eu-west-1.amazonaws.com/peculiar-wp-peculiar-wp-nginx-prod:latest
