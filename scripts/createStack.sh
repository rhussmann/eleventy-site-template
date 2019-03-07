#!/usr/bin/env sh

STACK_NAME=$1
DOMAIN_NAME=$2

echo "Creating stack $STACK_NAME for domain $DOMAIN_NAME..."

STACK_ID=`aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body=file://cloudformation/site-cloudformation.yml \
    --parameters ParameterKey=DomainName,ParameterValue=$DOMAIN_NAME \
    | jq -r '.StackId'`

while [ `aws cloudformation describe-stacks --stack-name=$STACK_ID | \
            jq -r '.Stacks[0].StackStatus'` != "CREATE_COMPLETE" ]; do
    echo "Waiting for stack creation completion..."
    sleep 3
done
