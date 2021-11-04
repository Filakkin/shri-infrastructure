#!/bin/bash

JSON_PAYLOAD=$(jq -c --arg key0 'queue' --arg value0 'TMP' --arg key1 'summary' --arg value1 "$1" '. | .[$key0]=$value0 | .[$key1]=$value1' <<< '{}')

FALLBACK="{\"queue\":\"TMP\",\"summary\":\"$1\"}"

echo "jq = $JSON_PAYLOAD"
echo "manuel=$FALLBACK"

curl \
-H "Authorization: OAuth $TOKEN" \
-H "X-Org-ID:$ORG_ID" \
-H "Content-Type: application/json" \
-d "'$FALLBACK'" \
-X POST \
https://api.tracker.yandex.net/v2/issues/