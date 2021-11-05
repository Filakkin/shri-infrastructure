#!/bin/bash

current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

APP_NAME=$(jq -r .id ../../config/main.json)
RELEASE_TAG=$RELEASE_VERSION
RELEASE_CODENAME=$(git for-each-ref --format="%(subject)" "refs/tags/$RELEASE_TAG")
echo "git for-each-ref --format=\"%(taggerdate:format:%d-%m-%Y %H:%M)\" \"refs/tags/$RELEASE_TAG\""
RELEASE_DATE=$(git for-each-ref --format="%(taggerdate:format:%d-%m-%Y %H:%M)" "refs/tags/$RELEASE_TAG")
CHANGELOG=$(./getChanges.sh $RELEASE_TAG $PREV_RELEASE)
DESCRIPTION="
**Версия**: $RELEASE_TAG
**Создан**: $RELEASE_DATE
**Codename**:
**Список изменений**:
#|
|| **Изменение** | **Коммит** | **Автор** ||
$CHANGELOG
|#
"

cd "$current_path"

jq -c \
--arg key0 'queue' --arg value0 'TMP' \
--arg key1 'summary' --arg value1 "$RELEASE_NAME" \
--arg key2 'unique' --arg value2 "$APP_NAME-$RELEASE_TAG" \
--arg key3 'description' --arg value3 "$DESCRIPTION" \
'. | .[$key0]=$value0 | .[$key1]=$value1 | .[$key2]=$value2 | .[$key3]=$value3 '<<< '{}' > $1