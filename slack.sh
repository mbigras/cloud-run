#!/usr/bin/env bash
# Send an example slack webhook

APP_URL=https://app-dsnnwlgmrq-uw.a.run.app
APP_VERSION=0.0.3

if [ -z $SLACK_URL ]
then
	echo Failed to set required env var SLACK_URL
	exit 1
fi

curl \
-X POST \
--data-urlencode "payload={\"channel\": \"#general\", \"text\": \"App is running <${APP_URL}/version|version 0.0.4>\"}" \
$SLACK_URL
