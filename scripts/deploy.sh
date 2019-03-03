#!/usr/bin/env sh

STACK_NAME=$1
DOMAIN_NAME=`jq -r '.[] | select(.ParameterKey == "DomainName") | .ParameterValue' < cloudformation/parameters.json`

echo "Creating stack $STACK_NAME for domain $DOMAIN_NAME..."

aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body=file://cloudformation/site-cloudformation.yml \
    --parameters=file://cloudformation/parameters.json
