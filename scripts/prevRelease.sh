#!/bin/bash
echo $(git describe --abbrev=0 --match v*.* $1^)