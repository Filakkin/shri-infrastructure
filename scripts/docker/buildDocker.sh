#!/bin/sh

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
parent_path=$(dirname "$SCRIPT")


JSON_PATH=$parent_path/docker-comment-payload.json
APP_NAME=$(jq -r .id ./config/main.json)
TAG=$($parent_path/../releaseTag.sh)

lower=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]')
echo $lower
name=$(echo $lower | sed "s/ /-/g")
echo "$name:$TAG"



docker build --tag $name:$TAG -f $parent_path/../../Dockerfile $parent_path/../../app

$parent_path/genCommentJson.sh "$name:$TAG" $JSON_PATH 

TASK_ID=$($parent_path/../searchTask.sh)

$parent_path/postImageName.sh $JSON_PATH $TASK_ID