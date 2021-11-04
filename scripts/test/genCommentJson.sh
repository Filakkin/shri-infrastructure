#!/bin/bash

current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

TEXT="
**Результаты запуска автотестов**: 
$(<test-output.txt)"

jq -c \
--arg key0 'text' --arg value0 "$TEXT" \
'. | .[$key0]=$value0 '<<< '{}' > $1