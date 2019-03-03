#!/usr/bin/env sh

DOMAIN_NAME=`jq -r '.[] | select(.ParameterKey == "DomainName") | .ParameterValue' < cloudformation/parameters.json`

aws s3 cp --recursive _site s3://$DOMAIN_NAME/
