#!/bin/bash
# or pull or clone repository
dockerimagetag="vgcmdedockerimage:1.0"
# entendo que so tem uma instancia do docker com essa imagem rodando...
firstdockerinstance=$(sudo docker ps -a | grep -P "${dockerimagetag}" | awk 'NR==1{print $1}')
sudo docker exec -it $firstdockerinstance /bin/bash -c "$(realpath './my-scripts/pull-clone-repository.sh') "

