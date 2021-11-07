#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

GITHUB_LINK=$(jq -r .github $parent_path/../../config/main.json)
git log --no-merges --format="|| %<(80,trunc)%s | %<(7)(($GITHUB_LINK/commit/%H %h)) | %an ||" $1...$2