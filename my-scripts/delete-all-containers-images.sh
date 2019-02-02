#!/bin/bash
# title           : create-run-docker-container.sh
# description     : delete containers and image.  
# author          : vinigomescunha
# date            : 2019-02-01
# bash_version    : 4.2
#==============================================================================
source "config.sh"
function delete_all_images {
  while IFS= read -r line; do
    eval "sudo docker rmi ${line}"
  done < <( sudo docker images | awk 'NR!=1{print $1":"$2" "$3}'| grep "${DOCKER_IMG_TAG}"|awk '{print $2}' )
}
function delete_all_containers {
  while IFS= read -r line; do
    eval "sudo docker stop ${line}" && eval "sudo docker rm ${line}"
  done < <( eval "sudo docker ps -a | awk 'NR!=1&&\$2==\"${DOCKER_IMG_TAG}\"{ print \$1}'" )
}
delete_all_containers
delete_all_images
