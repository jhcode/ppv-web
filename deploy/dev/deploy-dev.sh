#!/usr/bin/env bash
ecs deploy ppv-prod ppv-prod-website -e ppv-website DB_NAME ${DB_NAME} -e ppv-website DB_USER ${DB_USER} -e ppv-website DB_PASSWORD ${DB_PASSWORD} -e ppv-website DB_HOST ${DB_HOST}  --timeout 240 > /dev/null

