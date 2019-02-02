#!/bin/bash
# title           : create-gitdeploy-request.sh
# description     : Send script to update repo in in the docker instance 
# author          : vinigomescunha
# date            : 2019-02-01
# bash_version    : 4.2
#==============================================================================
source "config.sh"
source $(realpath './my-scripts/create-git-deploy-request-docker.sh')
CONFIG_VARS="$(cat 'config.sh')  | sed 's/\"/\x27'"
firstdockerinstance="$(sudo docker ps -a | grep -P "${DOCKER_IMG_TAG}" | awk 'NR==1{print $1}')"
if [ ! -z "$firstdockerinstance" ]; then
  sudo docker exec -it $firstdockerinstance /bin/bash -c "
  $CONFIG_VARS
  $(typeset -f allocate_script_remote)
  allocate_script_remote"
else
  echo "No container running..."
fi