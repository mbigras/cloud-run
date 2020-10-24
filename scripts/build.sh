#!/usr/bin/env bash
# Build app using Cloud Build
#
# Envionment Variables:
#
# VERSION - defaults to version.VERSION variable

set -ex

VERSION=${VERSION:-$(python -m version)}

gcloud builds submit --tag=us.gcr.io/playfulpanda/app:$VERSION
