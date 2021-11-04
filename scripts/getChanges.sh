#!/bin/bash
git log --format="|| %<(80,trunc)%s | %<(7)(%h) | %an ||" $1...$2