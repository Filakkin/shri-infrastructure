#!/bin/bash

echo $(git tag --sort=-taggerdate --merged | grep -E 'v[0-9]+\.[0-9]+(\.[0-9]+)?' | sed -n 1p)