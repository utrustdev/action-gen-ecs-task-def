#!/bin/sh -ue

output=task_definition.json

template=$1
dictionary=$2
tag=$3
parsed_tag=$(echo $tag | sed 's|.*/||')
image=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$3:$parsed_tag

/gen.py \
  --template $template \
  --dictionary $dictionary \
  -a DOCKER_IMAGE=$image \
  -a GIT_HASH=$parsed_tag \
  > $output

echo ::set-output name=file::$output
