#!/bin/bash
# title           : create-docker-image.sh
# description     : list the docker images and find if exist specific image, else create 
# author          : vinigomescunha
# date            : 2019-02-01
# bash_version    : 4.2
#==============================================================================
source "config.sh"
while IFS= read -r line; do
  if [ "$line" == "$DOCKER_IMG_TAG" ]; then
    echo "Image docker: $line already exists!"
    sleep 2
    exit 0;
  fi
done < <( sudo docker images | awk '{if(NR!=1) print $1":"$2}' )
sudo docker build -t ${DOCKER_IMG_TAG} ${GIT_REPOSITORY}
