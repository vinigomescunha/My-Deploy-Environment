#!/bin/bash
cd /my-app
sleep 2
username="vinigomescunha"
# https://github.com/settings/tokens :  admin:repo_hook and repo
access_token=""
if [ "$(git rev-parse --is-inside-work-tree)" == "true" ]; then
  echo "Update git repository"
else
  echo "Cloning repository"
  eval "git clone https://github.com/vinigomescunha/My-Deploy-Environment.git"
fi
