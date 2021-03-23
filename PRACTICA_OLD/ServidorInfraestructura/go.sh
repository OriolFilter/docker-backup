#!/bin/bash
SSH="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o loglevel=ERROR -i CLAU"
SSHP="2222"
NAMEVM="MAINS-OFA"
USER='sjo'
STACK="pt"

# Copiar files config

scp -P $SSHP $SSH  -r ./files/* $USER@localhost:~


# DHCP

CMD="echo transferint e iniciant lescript de configuracio ;
bash ./scriptSetup.sh;
sleep 3;
journalctl -u isc-dhcp-server.service --since '1 min ago';
journalctl -u bind9 --since '1 min ago';
"
ssh -p $SSHP $SSH  -t $USER@localhost "bash -c $CMD"
