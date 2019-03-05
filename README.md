# eleventy-site-template

## Overview

This is a template for creating an [eleventy](https://www.11ty.io/) site, including Cloudformation templates for generating an S3 website bucket on AWS.

## Quickstart
### Prerequesites

This template depends on the following tools being installed on your system.

1. [AWS CLI tools](https://aws.amazon.com/cli/)
2. [jq](https://stedolan.github.io/jq/)
3. [nvm](https://github.com/creationix/nvm)
4. [yarn](https://yarnpkg.com/en/) or [npm](https://www.npmjs.com/get-npm) (I prefer yarn)

### Setting Up the Infrastructure

1. Modify the AWS Cloudformation stack in the `config.stack_name` section of `package.json`; you can change this to whatever you'd like, it's only used to identify the Cloudformation stack in AWS
2. Modify the `config.domain_name` field in `package.json` to the domain of the site you're hosting (again, this doesn't need to be accuate; it's really only used to create a unique S3 bucket name).

### Creating the Infrastructure

1. Run `yarn create_stack` to create the S3 website bucket.

### Deploying your Site

**TODO** Fill this section out when complete.
