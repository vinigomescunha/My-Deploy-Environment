#!/bin/bash
source './config.sh'
source "./my-scripts/create-hooks.sh"
action=""
help() { echo "Arguments: $0 [-i : Create Image ] [-c : Create Container ]" 1>&2; exit 1; }
create_docker_image() { source "./my-scripts/create-docker-image.sh" 1>&2; exit 1;  }
create_run_docker_container() { source "./my-scripts/create-run-docker-container.sh" 1>&2; exit 1;  }
while getopts "ic" o; do
  action="${o}"
  case "${o}" in
    i)
      echo "Creating docker image...";create_docker_image
      ;;
    c)
      echo "Running docker container...";create_run_docker_container
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

