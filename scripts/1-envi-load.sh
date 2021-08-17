#!/bin/bash

REPO_NAME=$1
BRANCH_NAME=$2
SEPARATOR='__'

cat /dev/null > /workspace/src/devops/secret-env
REPO_SECRETS="REPO_SECRETS"
BRANCH_SECRETS="BRANCH_SECRETS"

echo -e "found secrets for the repo $REPO_NAME"
echo -e "$REPO_SECRETS"
echo -e "found secrets for the branch $BRANCH_NAME of $REPO_NAME"
echo -e "$BRANCH_SECRETS"

echo -e "$REPO_SECRETS" >> /workspace/src/devops/secret-env
echo -e "$BRANCH_SECRETS" >> /workspace/src/devops/secret-env

cat /dev/null > /workspace/src/devops/_docker-build-env
echo "check the existence of /workspace/src/devops/build-env-firebase"
if [[ -f "/workspace/src/devops/build-env-firebase" ]]; then
  echo "/workspace/src/devops/build-env-firebase found:"
  cat "/workspace/src/devops/build-env-firebase"
  cat "/workspace/src/devops/build-env-firebase" >> /workspace/src/devops/_docker-build-env
fi
echo "check the existence of /workspace/src/devops/build-env-firebase-$BRANCH_NAME"
if [[ -f "/workspace/src/devops/build-env-firebase-$BRANCH_NAME" ]]; then
  echo "/workspace/src/devops/build-env-firebase-$BRANCH_NAME found:"
  cat "/workspace/src/devops/build-env-firebase-$BRANCH_NAME"
  cat "/workspace/src/devops/build-env-firebase-$BRANCH_NAME" >> /workspace/src/devops/_docker-build-env
fi
if [[ -f "/workspace/src/devops/secret-env" ]]; then
  cat /workspace/src/devops/secret-env >> /workspace/src/devops/_docker-build-env
fi
echo -e "BRANCH=$1" >> /workspace/src/devops/_docker-build-env
