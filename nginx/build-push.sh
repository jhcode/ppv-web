#!/usr/bin/env bash
export AWS_PROFILE=mt
eval $(aws ecr get-login --no-include-email --region eu-west-1)
docker build -t ppv-prod-nginx .
docker tag ppv-prod-nginx:latest 780172389235.dkr.ecr.eu-west-1.amazonaws.com/ppv-prod-nginx:latest
docker push 780172389235.dkr.ecr.eu-west-1.amazonaws.com/ppv-prod-nginx:latest
