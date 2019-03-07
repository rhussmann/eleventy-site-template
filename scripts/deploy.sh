#!/usr/bin/env sh

DOMAIN_NAME=$1

aws s3 cp --recursive _site s3://$DOMAIN_NAME/
