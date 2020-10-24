#!/usr/bin/env bash
# Deploy app to Cloud Run
#
# Envionment Variables:
#
# VERSION   - default: version.VERSION variable
# APP_URL   - Cloud Run URL, default: https://app-dsnnwlgmrq-uw.a.run.app
# SLACK_URL - egfast Slack URL, source env.sh, required

set -ex

VERSION=${VERSION:-$(python -m version)}
APP_URL=${APP_URL:-https://app-dsnnwlgmrq-uw.a.run.app}

if [ -z $SLACK_URL ]
then
	echo error: required SLACK_URL env var not set, source from env.sh
	exit 1
fi

gcloud run deploy app \
--image=us.gcr.io/playfulpanda/app:$VERSION \
--set-env-vars=APP_URL=$APP_URL,SLACK_URL=$SLACK_URL \
--platform=managed \
--region=us-west1 \
--allow-unauthenticated
