#!/bin/bash

current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

#TODO вынести генерацию описания задачи в отдельный скрипт, так как эта часть дублирована в genCreateTaskJson.sh
RELEASE_TAG=$RELEASE_VERSION
RELEASE_DATE=$(git for-each-ref --format="%(taggerdate:format:%d-%m-%Y %H:%M)" "refs/tags/$RELEASE_TAG")
RELEASE_CODENAME=$(git for-each-ref --format="%(subject)" "refs/tags/$RELEASE_TAG")
CHANGELOG=$(./getChanges.sh $RELEASE_TAG $PREV_RELEASE)
DESCRIPTION="
**Версия**: $RELEASE_TAG
**Создан**: $RELEASE_DATE
**Codename**: $RELEASE_CODENAME
**Список изменений**:
#|
|| **Изменение** | **Коммит** | **Автор** ||
$CHANGELOG
|#
"

cd "$current_path"

jq -c \
--arg key0 'description' --arg value0 "$DESCRIPTION" \
'. | .[$key0]=$value0 '<<< '{}' > $1