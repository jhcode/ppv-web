#!/usr/bin/env bash
eval $(aws ecr get-login --no-include-email --region ${AWS_REGION})
docker build -t picogauge-website .
docker tag ppv-website:latest 780172389235.dkr.ecr.eu-west-1.amazonaws.com/ppv-website:latest
docker push 780172389235.dkr.ecr.eu-west-1.amazonaws.com/ppv-website:latest
