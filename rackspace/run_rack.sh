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

function create_server {

echo "kreiram rackspace server ..."
`ruby create_server.rb`

}

function manage_dns {

#PUBLIC_IP=`./export_public_ip.rb | sed -e 's/export OS_PUBLIC_IP=//'`
PUBLIC_IP=`ruby public_ip.rb`

echo "vrsim update domena $OS_DNS_DOMAIN, zapis $OS_SERVER_NAME sa javnom adresom $PUBLIC_IP"
echo ./manage_domains.py  -d $OS_DNS_DOMAIN -r $OS_SERVER_NAME -i $PUBLIC_IP
./manage_domains.py  -d $OS_DNS_DOMAIN -r $OS_SERVER_NAME -i $PUBLIC_IP


}


create_server
manage_dns

#echo setujem OS_ENVARS u kojima je setovana varijabla GITHUB_USER
export $OS_ENVARS

echo "OS_ENVARS: $OS_ENVARS"

BOOTSTRAP_URL=https://raw.github.com/$GITHUB_USER/ubuntu_bootstrap_chef/master/bootstrap.sh

echo "na kreiranom rackspace server kreiram boostrap_project.sh koji je = export OS_ENVARS + boostrap.sh"
BASH_F="boostrap_project.sh"
CMD="apt-get install -y curl && ( echo -e 'export $OS_ENVARS\n' > $BASH_F && curl -L $BOOTSTRAP_URL >> $BASH_F && bash $BASH_F )"
run_ssh "$CMD"

