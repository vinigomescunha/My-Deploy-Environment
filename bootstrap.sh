#!/bin/bash
source './config.sh'
source "./my-scripts/create-hooks.sh"
action=""
help() { echo "Arguments: $0 [ -c Create Container] [-d : Delete Image and Containers ] [-i : Create Image ] " 1>&2; exit 1; }
create_docker_image() { source "./my-scripts/create-docker-image.sh" 1>&2;  }
create_run_docker_container() { source "./my-scripts/create-run-docker-container.sh" 1>&2; exit 1;  }
delete_git_containers_images() { source "./my-scripts/delete-all-containers-images.sh" 1>&2; exit 1;  }

while getopts "cdi" o; do
  action="${o}"
  case "${o}" in
    c)
      echo "Running docker container...";create_run_docker_container
      ;; 
    d)
      echo "Delete all containers and images...";delete_git_containers_images
      ;; 
    i)
      echo "Creating docker image...";create_docker_image
      ;; 
    *)
      help
      ;;
  esac
done
shift $((OPTIND-1))
if [ -z "${action}" ]; then
    help
fi

