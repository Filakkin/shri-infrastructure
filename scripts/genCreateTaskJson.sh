#!/bin/bash

jq -c \
--arg key0 'queue' --arg value0 'TMP' \
--arg key1 'summary' --arg value1 "$1" \
'. | .[$key0]=$value0 | .[$key1]=$value1' <<< '{}' > $2