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





#Dades de portainer
#Aixequem l'stack
sudo docker stack deploy -c ./docker/docker-compose.yml domainservices
