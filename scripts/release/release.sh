#!/bin/bash
current_path=$(pwd)
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

RELEASE_VERSION=$(../releaseTag.sh)
PREV_VERSTION=$(../prevRelease.sh $RELEASE_VERSION)
CHANGELOG=$(./getChanges.sh $RELEASE_VERSION $PREV_VERSION)

TASK_ID=$(./searchTask.sh)
if [ $TASK_ID != null ];
    then ./createTask.sh
    else ./updateTask.sh $TASK_ID $CHANGELOG
fi