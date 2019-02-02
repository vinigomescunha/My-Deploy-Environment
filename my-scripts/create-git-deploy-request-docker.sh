#!/bin/bash
# title           : create-git-deploy-request-docker.sh
# description     : Script that will be executed in the docker container 
# author          : vinigomescunha
# date            : 2019-02-01
# bash_version    : 4.2
#==============================================================================
function allocate_script_remote {
  echo "Script is executing in the docker container"
  cd /my-app
  sleep 2
  if [ "$(git rev-parse --is-inside-work-tree)" == "true" ]; then
    echo "Update git repository"
    eval "git pull ${GIT_PROTOCOL}${GIT_USERNAME}:${GIT_ACCESS_TOKEN}@${GIT_REPOSITORY}" 2>&1
  else
    echo "Cloning repository"
    eval "git clone ${GIT_PROTOCOL}${GIT_REPOSITORY} . " 2>&1
    npm i
    eval "nodemon ./index.js ${HOST_SERVER} ${PORT_SERVER}"
  fi
}