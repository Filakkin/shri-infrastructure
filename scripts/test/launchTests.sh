#!/bin/bash
current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd ./app
npm install
npx jest --no-color 2>$current_path/test-output.txt

JSON_PATH=$parent_path/test-comment-payload.json

$parent_path/genCommentJson.sh $current_path/test-output.txt $JSON_PATH 

TASK_ID=$($parent_path/../searchTask.sh)

$parent_path/postResults.sh $JSON_PATH $TASK_ID