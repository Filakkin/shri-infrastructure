#!/bin/bash

RELEASE_TAG=$RELEASE_VERSION
RELEASE_DATE=$(git for-each-ref --format="%(taggerdate:format:%d-%m-%Y %H:%M)" "refs/tags/$RELEASE_TAG")
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

echo "$DESCRIPTION"