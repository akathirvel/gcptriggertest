#!/bin/bash

_SRC_REPO_URL=$1
_BRANCH=$2
ssh_key=$3
echo "Creating floder....."
mkdir /root/.ssh
echo "DONE Creating floder....."
echo "$ssh_key" >> /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa
ssh-keyscan github.com > /root/.ssh/known_hosts
 
git clone -b $_BRANCH  https://akathirvel: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@github.com/akathirvel/basic-nextjs.git src
(cd src; git log -1)
