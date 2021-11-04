#!/bin/bash

curl \
-H "Authorization: OAuth $TOKEN" \
-H "X-Org-ID:$ORG_ID" \
-d "queue=TMP&summary=$1&assignee=filakkin" \
-X POST \
https://api.tracker.yandex.net/v2/issues/