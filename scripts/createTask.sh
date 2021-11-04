#!/bin/bash

curl \
-H "Authorization: OAuth $TOKEN" \
-H "X-Org-ID:$ORG_ID" \
-d "$(jq --arg key0 'queue' --arg value0 'TMP' --arg key1 'summary' --arg value1 '$1' '. | .[$key0]=$value0 | .[$key1]=$value1' <<< '{}')" \
-X POST \
https://api.tracker.yandex.net/v2/issues/