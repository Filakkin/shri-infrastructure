#!/bin/bash

echo $(git tag | grep -E 'v[0-9]+\.[0-9]+(\.[0-9]+)?' | sort -V -r | sed -n 1p)