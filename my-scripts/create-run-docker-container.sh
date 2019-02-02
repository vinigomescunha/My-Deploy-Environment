#!/bin/bash
# title           : create-run-docker-container.sh
# description     : Insert hooks into git repository to custom activities during commit, push, ...  
# author          : vinigomescunha
# date            : 2019-02-01
# bash_version    : 4.2
#==============================================================================
source "config.sh"
firstdockerinstance=$(sudo docker ps -a | grep -P "${DOCKER_IMG_TAG}" | awk 'NR==1{print $1}')
function kill_process_port {
  if [[ $(eval "lsof -i:$1") ]]; then
    echo " Killing port: $1! ";
    eval "fuser -k $1/tcp" 2>&1
  else
    echo "Port $1 is iddle!"
  fi
}
function stop_all_instances_running {
  for container in  $(sudo docker ps | grep -P "${DOCKER_IMG_TAG}" | awk '{print $1}'  ); do
    echo "$container found..."
    eval "sudo docker stop $container"
  done
}
kill_process_port "${PORT_SERVER}"
stop_all_instances_running
if [ "" == "${firstdockerinstance}" ]; then
    eval "sudo docker run -p ${PORT_SERVER}:${PORT_SERVER} -d -i ${DOCKER_IMG_TAG}"
  else
    eval "sudo docker start ${firstdockerinstance}"
fi
