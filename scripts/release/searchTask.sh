#!/bin/bash

APP_NAME=$(jq -r .id ../config/main.json)
RELEASE_TAG=$(./releaseTag.sh)

RESULT=$(curl \
-X POST \
-H "Authorization: OAuth $TOKEN" \
-H "X-Org-ID:$ORG_ID" \
-H "Content-Type: application/json" \
-d "{\"filter\":{\"unique\":\"$APP_NAME-$RELEASE_TAG\"}}" \
https://api.tracker.yandex.net/v2/issues/_search)

echo "$RESULT" | jq -r .[0].key