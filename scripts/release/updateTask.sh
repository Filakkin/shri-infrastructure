#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
JSON_PATH=./update-payload.json

$parent_path/genUpdateTaskJson.sh $JSON_PATH

curl \
-X PATCH \
-H "Authorization: OAuth $TOKEN" \
-H "X-Org-ID:$ORG_ID" \
-H "Content-Type: application/json" \
-d @$JSON_PATH \
https://api.tracker.yandex.net/v2/issues/$1