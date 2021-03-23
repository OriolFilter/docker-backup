#!/bin/bash
### script que genera setup de l'stack "domainservices"
DIRBASE="$HOME"
STACK="dock"

#Fem export, xq aquestes vbles han d'estar accessible fora de l'script, en concret al .yaml
export DIRDATASTACK="$DIRBASE/stacks/$STACK"
#export DOMAIN="ctg.itb"  # No fa falta, revisar, alomillor puc ficar el portainer tamb, por si aca

#mkdir -p "$DIRDATASTACK"
#mkdir -p "$DIRDATASTACK/data"
#mkdir -p "$DIRDATASTACK/bind"


#docker run --name bind -it --rm \
#  --publish 53:53/tcp --publish 53:53/udp --publish 10000:10000/tcp \
#  --volume /srv/docker/bind:/data \
#  sameersbn/bind:9.16.1-20200524 -h


#Dades de portainer
#Aixequem l'stack
sudo docker stack deploy -c ./docker/docker-compose.yml domainservices
