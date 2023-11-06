#!/bin/sh

# run this script before build
if [ "${1}" = "" ]; then
    PATCH_VERSION=0
else
    PATCH_VERSION="${1}"
fi
echo 'PATCH_VERSION = "'${PATCH_VERSION}'"' > version/PATCH_VERSION.bzl
