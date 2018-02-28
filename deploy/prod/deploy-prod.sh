#!/usr/bin/env bash
ecs deploy mettalloids-prod peculiar-ppv-peculiar-ppv -e peculiar-ppv DB_NAME ${DB_NAME} -e peculiar-ppv DB_USER ${DB_USER} -e peculiar-ppv DB_PASSWORD ${DB_PASSWORD} -e peculiar-ppv DB_HOST ${DB_HOST}  --timeout 240 > /dev/null
