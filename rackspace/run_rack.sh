#!/bin/bash

USER=root
PRIVATE_KEY=$OS_SSH_KEY
SSH_OPT="StrictHostKeyChecking=no"
if [[ -z "$PRIVATE_KEY" ]]; then
   PRIVATE_KEY=~/.ssh/sezame_otvori_se
fi

function run_ssh {

echo "running cmd via ssh: '$1'"
ssh -o $SSH_OPT -i $PRIVATE_KEY $USER@$PUBLIC_IP $1


}

#CMD=`ruby export_public_ip.rb`

PUBLIC_IP=`./export_public_ip.rb | sed -e 's/export OS_PUBLIC_IP=//'`

echo "PUBLIC_IP=$PUBLIC_IP"

// ucitaj envars
export $OS_ENVARS

echo "OS_ENVARS: $OS_ENVARS"

BASH_F="boostrap_project.sh"
BOOTSTRAP_URL=https://raw.github.com/$GITHUB_USER/ubuntu_bootstrap_chef/master/bootstrap.sh

CMD="apt-get install -y curl && ( echo -e '$OS_ENVARS\n' > $BASH_F && curl -L $BOOTSTRAP_URL >> $BASH_F && bash $BASH_F )"
run_ssh "$CMD"

#nova reboot [--hard] [--poll] <server>
#echo rebooting server
#nova reboot $SERVER_NAME