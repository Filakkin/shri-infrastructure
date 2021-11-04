#!/bin/bash
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
parent_path=$(dirname "$SCRIPT")

TEXT="**Создан контейнер**: $1"

echo "$1 $2"

jq -c \
--arg key0 'text' --arg value0 "$TEXT" \
'. | .[$key0]=$value0 '<<< '{}' > $2