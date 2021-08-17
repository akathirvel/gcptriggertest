#!/bin/bash
_SRC_REPO_URL=$1
_BRANCH=$2
_REPO=$3

echo -e 'Source code location is $_SRC_REPO_URL'
echo -e 'Branch  is $_BRANCH'
echo -e '_OTHR is $_REPO'
echo $_SRC_REPO_URL
echo $_BRANCH
echo $_REPO


if (($(date '+%-e')%2)); then
    echo 'today is  an  odd day'
else
    echo 'today is an odd day  with an even number'
fi
