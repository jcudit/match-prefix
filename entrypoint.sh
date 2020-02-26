#!/bin/bash

debug_context () {
  jq -rc '.' $GITHUB_EVENT_PATH
  env
}

comment_body () {
  jq -rc '.comment.body' $GITHUB_EVENT_PATH
}

actions_url () {
  echo https://github.com/${GITHUB_REPOSITORY}/actions
}

issue_number () {
  jq -rc '.issue.number' $GITHUB_EVENT_PATH
}

if [[ $(comment_body) == *debug=true* ]]; then
  debug_context
fi

# Match the desired prefix or fail
echo "Checking For Prefix Match ..."
echo ::set-output name=result::false
echo $(comment_body) | egrep "^${INPUT_PREFIX} " || exit 1

echo "Setting Successful Outputs On Match ..."
echo ::set-output name=result::true
echo ::set-output name=actions_url::$(actions_url)
echo ::set-output name=issue_number::$(issue_number)
echo ::set-output name=issue_actor::${GITHUB_ACTOR}
