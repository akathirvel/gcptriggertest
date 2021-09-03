#!/bin/bash
_BRANCH_SHORT=$1

source utils.sh

source "/workspace/src/devops/config" #creates variable firebase_test_project, live_branches and enable_preview_branches
[[ -z "$live_branches" ]] && { live_branches=("master" "JIT","UAT"); }
[[ -z "$enable_preview_branches" ]] && { enable_preview_branches=true; }
[[ -z "$firebase_test_project" ]] && { echo "ERROR: firebase_test_project not set in src/devops/config"; exit 1; }



cd /workspace/src

cp "./devops/firebase.json" firebase.json
sed -i -e "s/BRANCH_PLACEHOLDER/$_BRANCH_SHORT/g" firebase.json

firebase use "$firebase_test_project"

if arrayContains live_branches "$_BRANCH_SHORT"; then
  firebase hosting:sites:create "$firebase_test_project-$_BRANCH_SHORT"
  firebase target:apply hosting "$_BRANCH_SHORT" "$firebase_test_project-$_BRANCH_SHORT"
  firebase deploy --only hosting:"$_BRANCH_SHORT"
elif [ "$enable_preview_branches" = true ]; then
  firebase target:apply hosting "$_BRANCH_SHORT" "$firebase_test_project"
  firebase hosting:channel:deploy "$_BRANCH_SHORT" --expires 7d
fi
