#!/bin/bash
dockerimagetag="vgcmdedockerimage:1.0"
while IFS= read -r line; do
  if [ "$line" == "$dockerimagetag" ]; then
    echo "Image docker: $line already exists!"
    sleep 2
    exit 0;
  fi
done < <( sudo docker images | awk '{if(NR!=1) print $1":"$2}' )
sudo docker build -t ${dockerimagetag} https://github.com/vinigomescunha/My-Deploy-Environment.git
