
#!/bin/bash
SCRIPTFOLDER="$(dirname $0)"
#SSH="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o loglevel=ERROR -i CLAU"
SSHP="22"
HOSTNAME="rpi4"
USER="ubuntu"
#FILESFOLDER="pihouse""
#STACK="stack"
#STACK="stackdeploy"
DOCKERFOLDER="docker"

IPS="192.168.1.2" # IP SERVER

DOMAIN="filter.net"
IP="192.168.1.2"
IPXM="192.168.1.0"
GATE="192.168.1.1"
MASQ="24"
DNS2="8.8.8.8"

# Copiar files config

#scp -P $SSHP $SSH -r -f $SCRIPTFOLDER/$DOCKERFOLDER/ $USER@$IPS:~
scp -P $SSHP -r $SCRIPTFOLDER/$DOCKERFOLDER/ $USER@$IPS:~

### Command start

CMD="echo 'zzzzzzzzzz';
printf '# Transferint e iniciant lscript de configuracio\n';

## PREPARAR LA XARXA 

printf '# Disable default dns\n';
sudo systemctl stop systemd-resolved;
sudo systemctl disable systemd-resolved;


printf '# Create netplan file\n';
printf \"
network:
    version: 2
    renderer: networkd
    ethernets:
        eth0:
            addresses:
                -  $IP/$MASQ
            gateway4:  $GATE
            nameservers:
                search: 
                   -  $DOMAIN
#                addresses: [$IP, $DNS2]
                addresses: [$DNS2]



\" #| sudo tee /etc/netplan/config.yaml

sudo rm /etc/resolv.conf;

printf \"updating resolv\n\";
printf \"
# Resolv
domain $DOMAIN
search $DOMAIN
nameserver 127.0.0.1
nameserver $DNS2
\" | sudo tee /etc/resolv.conf;


## Start stack
#
#cd ./$FILESFOLDER/;
#docker stack deploy --compose-file docker-compose.yml $STACK;
#
#
###docker stats;
#watch docker stack services $STACK;

sudo netplan apply;

# Canviar hostname?

printf \"$HOSTNAME\" | sudo tee /etc/hostname

# sudo reboot;

"

### Command end

ssh -p $SSHP -t $USER@$IPS "bash -c $CMD"
