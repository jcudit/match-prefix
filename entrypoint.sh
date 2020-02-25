#!/bin/bash

# Debug Context
jq -rc '.' $GITHUB_EVENT_PATH
env

# Match the desired prefix or fail
echo ::set-output name=result::false
echo ${COMMENT_BODY} | egrep -q "^\${MATCH_PREFIX} " || exit 1
echo ::set-output name=result::true
