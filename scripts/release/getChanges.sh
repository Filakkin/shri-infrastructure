#!/bin/bash
git log --no-merges --format="|| %<(80,trunc)%s | %<(7)(%h) | %an ||" $1...$2