#!/bin/bash
# get the first container and run
# kill port
dockerimagetag="vgcmdedockerimage:1.0"
firstdockerinstance=$(sudo docker ps -a | grep -P "${dockerimagetag}" | awk 'NR==1{print $1}')

function kill_process_port {
  if [[ $(eval "lsof -i:$1") ]]; then
    echo " Killing port: $1  ";
    eval "fuser -k $1/tcp" 2>&1
  else
    echo "Port $1 is iddle"
  fi
}
function stop_all_instances_running {
  for container in  $(sudo docker ps | grep -P "${dockerimagetag}" | awk '{print $1}'  ); do
    echo "$container"
    sudo docker stop $container
  done
}
kill_process_port "9000"
stop_all_instances_running
if [ "" == "${firstdockerinstance}" ]; then
    sudo docker run -p 9000:9000 -d -i ${dockerimagetag}
  else
    sudo docker start ${firstdockerinstance}
fi
