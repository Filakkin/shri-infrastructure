#!/bin/bash

FALLBACK="{\"queue\":\"TMP\",\"summary\":\"$1\",\"assignee\":[\"259985626\"]}"

echo "jq    ='$(jq . -c $2)'"
echo "manuel='$FALLBACK'"

curl \
-X POST \
-H "Authorization: OAuth $TOKEN" \
-H "X-Org-ID:$ORG_ID" \
-H "Content-Type: application/json" \
-d @$2 \
https://api.tracker.yandex.net/v2/issues/