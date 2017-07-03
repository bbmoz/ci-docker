#!/usr/bin/env bash

set -e

# There are two directories here:
# 1. `ci-docker/` which is the project downloaded from latest master
# 2. `npm-cache/` which is the cache from the minio server

# According to the `task.yml`, there should be one output directory:
# 1. `new-npm-cache/` which is the newly built dependencies

# Run build here!
