#!/bin/bash

echo "Hello World inside Script"

echo $(pip --version)

echo $(curl --get -H "Authorization:OAuth $TOKEN" -H "X-Org-ID:$ORG_ID" https://api.tracker.yandex.net/v2/self)