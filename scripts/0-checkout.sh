#!/bin/bash

_SRC_REPO_URL=$1
_BRANCH=$2
ssh_key=$3

 echo "Helloooooo Angles "
git clone -b $_BRANCH  https://akathirvel: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@github.com/akathirvel/basic-nextjs.git src
(cd src; git log -1)
