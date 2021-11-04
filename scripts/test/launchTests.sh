#!/bin/bash
npm install
npx jest --no-color 2>test-output.txt

current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

JSON_PATH=$parent_path/test-comment-payload.json

$parent_path/genCommentJson.sh $JSON_PATH 

TASK_ID=$($parent_path/../searchTask.sh)

$parent_path/postResults.sh $JSON_PATH $TASK_ID