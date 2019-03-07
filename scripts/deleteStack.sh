#!/usr/bin/env sh

STACK_NAME=$1
DOMAIN_NAME=$2

echo "Deleting stack $STACK_NAME for domain $DOMAIN_NAME..."

STACK_ID=`aws cloudformation list-stacks \
    | jq -r '.StackSummaries[] \
    | select(.StackName == "eleventy-site-template" and .StackStatus == "CREATE_COMPLETE") | .StackId'`

aws s3 rb --force s3://$DOMAIN_NAME
aws cloudformation delete-stack --stack-name $STACK_ID

while [ `aws cloudformation describe-stacks --stack-name=$STACK_ID \
            | jq -r '.Stacks[0].StackStatus'` != "DELETE_COMPLETE" ]; do
    echo "Waiting for stack deletion completion..."
    sleep 3
done

