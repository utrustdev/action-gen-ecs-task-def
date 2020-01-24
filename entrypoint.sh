#!/bin/sh -ue

output=task_definition.json

template=$1
dictionary=$2
image=$3
tag=$4
parsed_tag=$(echo $tag | sed 's|.*/||')
image=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$image:$parsed_tag

/gen.py \
  --template $template \
  --dictionary $dictionary \
  -a DOCKER_IMAGE=$image \
  -a GIT_HASH=$parsed_tag \
  -a RELEASE=$parsed_tag \
  > $output

echo ::set-output name=file::$output
