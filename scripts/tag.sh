#!/usr/bin/env bash
# Tag a new release based on the version.VERSION variable

set -x

VERSION=$(python -m version)

git tag -a $VERSION -m "version $VERSION"

if [ -z $DRY_RUN ]
then
	git push --follow-tags origin master
	echo Pushed $VERSION tag to $(git remote -v | awk '/push/ { print $2 }')
else
	echo DRY_RUN env var set, skipping pushing tag
fi
