#!/bin/sh -ue

output=task_definition.json

template=$1
dictionary=$2
image=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$3:$GITHUB_SHA

/gen.py \
  --template $template \
  --dictionary $dictionary \
  -a DOCKER_IMAGE=$image \
  -a GIT_HASH=$GITHUB_SHA \
  > $output

echo ::set-output name=file::$output
