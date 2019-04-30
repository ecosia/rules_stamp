#!/usr/bin/env bash

set -eux

stamp=$(cat examples/STAMP_TEST)

if [[ "$stamp" != 'mytest' ]]; then
    exit 1
fi