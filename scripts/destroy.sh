#!/usr/bin/env sh

STACK_NAME=$1
DOMAIN_NAME=`jq -r '.[] | select(.ParameterKey == "DomainName") | .ParameterValue' < cloudformation/parameters.json`

echo "Deleting stack $STACK_NAME for domain $DOMAIN_NAME..."

aws s3 rb --force s3://$DOMAIN_NAME
aws cloudformation delete-stack --stack-name $STACK_NAME
