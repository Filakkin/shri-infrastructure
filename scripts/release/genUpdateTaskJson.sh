#!/bin/bash

current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

RELEASE_TAG=$(./releaseTag.sh)
PREV_RELEASE=$(./prevRelease.sh $RELEASE_TAG)
RELEASE_DATE=$(git for-each-ref --format="%(taggerdate:format:%d-%m-%Y %H:%M)" "refs/tags/$RELEASE_TAG")
CHANGELOG=$(./getChanges.sh $RELEASE_TAG $PREV_RELEASE)
DESCRIPTION="
**Версия**: $RELEASE_TAG
**Создан**: $RELEASE_DATE
**Список изменений**:
#|
|| Изменение | Коммит | Автор ||
$CHANGELOG
|#
"

cd "$current_path"

jq -c \
--arg key0 'description' --arg value0 "$DESCRIPTION" \
'. | .[$key0]=$value0 '<<< '{}' > $1