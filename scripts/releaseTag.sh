#!/bin/bash
git tag --sort=-taggerdate | grep -E 'v[0-9]+\.[0-9]+(\.[0-9]+)?' | sed -n 1p