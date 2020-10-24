#!/usr/bin/env bash
# Send slack message successful deployment message
# This gets run by Cloud Build after a successful deployment.

APP_URL=https://app-dsnnwlgmrq-uw.a.run.app
APP_VERSION=0.0.3

if [ -z $SLACK_URL ]
then
	echo Failed to set required env var SLACK_URL
	exit 1
fi

if [ -z $VERSION ]
then
	echo Failed to set required env var VERSION
	exit 1
fi

curl \
-X POST \
--data-urlencode "payload={\"channel\": \"#general\", \"text\": \"Succesfully deployed <${APP_URL}/version|App> version ${VERSION}\"}" \
$SLACK_URL
