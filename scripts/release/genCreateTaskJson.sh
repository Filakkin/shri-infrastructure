#!/bin/bash

current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

APP_NAME=$(jq -r .id ../../config/main.json)
#TODO вынести генерацию описания задачи в отдельный скрипт, так как эта часть дублирована в genUpdateTaskJson.sh
DESCRIPTION=$(./genDescription.sh)
cd "$current_path"

jq -c \
--arg key0 'queue' --arg value0 'TMP' \
--arg key1 'summary' --arg value1 "$RELEASE_NAME" \
--arg key2 'unique' --arg value2 "$APP_NAME-$RELEASE_VERSION" \
--arg key3 'description' --arg value3 "$DESCRIPTION" \
'. | .[$key0]=$value0 | .[$key1]=$value1 | .[$key2]=$value2 | .[$key3]=$value3 '<<< '{}' > $1