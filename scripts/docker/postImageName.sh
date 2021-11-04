#!/bin/sh

curl \
-X POST \
-H "Authorization: OAuth $TOKEN" \
-H "X-Org-ID:$ORG_ID" \
-H "Content-Type: application/json" \
-d @$1 \
https://api.tracker.yandex.net/v2/issues/$2/comments