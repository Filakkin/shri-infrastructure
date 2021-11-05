#!/bin/bash

current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

#TODO вынести генерацию описания задачи в отдельный скрипт, так как эта часть дублирована в genCreateTaskJson.sh
DESCRIPTION=$(./genDescription.sh)

cd "$current_path"

jq -c \
--arg key0 'description' --arg value0 "$(echo "$DESCRIPTION")" \
'. | .[$key0]=$value0 '<<< '{}' > $1