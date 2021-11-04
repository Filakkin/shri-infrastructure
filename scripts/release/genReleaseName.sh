#!/bin/bash
APP_NAME=$(jq -r .id $1)
echo "$APP_NAME $2 release"