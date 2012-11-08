#!/bin/bash

# https://gist.github.com/2775351

# http://www.wolfe.id.au/2012/09/10/how-i-use-chef-solo-with-ubuntu-12.04/

# ovaj mi pase
# https://gist.github.com/3328844

AUTHOR="Ernad Husremovic"
VERSION="0.6.0"
DATE="08.11.2012"
LICENSE="MIT"

GITHUB_USER=hernad
ADMIN_USER=admin
HOME_DIR=/home/$ADMIN_USER
# http://www.wolfe.id.au/2012/09/10/how-i-use-chef-solo-with-ubuntu-12.04/


# http://serverfault.com/questions/58378/add-new-user-with-root-access-in-linux

#run:
#sudo su root -c "(apt-get install -y curl) && (curl -L https://raw.github.com/hernad/ubuntu_bootstrap_chef/master/bootstrap.sh | bash)"

function line {
echo "----------------------------------------"
}


function header {
  line
  echo "boostrap chef environment"
  echo "Auhtor: $AUTHOR, version: $VERSION, $DATE"
  echo "License: $LICENSE"
  line
}

function create_admin_user {

  adm=`groups $ADMIN_USER | grep -c ":.*$ADMIN_USER"`

  if [[ $adm -eq 0 ]]; then
     useradd $ADMIN_USER -g $ADMIN_USER  -m -s /bin/bash
  fi
  usermod -a -G adm admin
}

function upgrade_system {
  apt-get -y update
  apt-get -y upgrade
}

function install_chef {
  apt-get -y install git build-essential autoconf zlib1g-dev libssl-dev \
      libreadline-dev libyaml-dev libcurl4-openssl-dev curl python-software-properties \
      ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 curl
  gem install chef ruby-shadow --no-ri --no-rdoc
}

function install_pub_key {

# Make the chef directory and chown it for my admin user.

mkdir /var/chef && chown admin:admin /var/chef
mkdir -p $HOME_DIR/.ssh

pub_key=$( curl -L https://raw.github.com/$GITHUB_USER/ubuntu_bootstrap_chef/master/sezame_otvori_se.pub )

echo "$pub_key" >> $HOME_DIR/.ssh/authorized_keys

chown $ADMIN_USER:$ADMIN_USER -R $HOME_DIR/.ssh
chmod 0640 $HOME_DIR/.ssh
chmod  0600 $HOME_DIR/.ssh/authorized_keys

}

# --------- start app ---------------------
header

echo "create admin user ..."
line
create_admin_user
line

echo "upgrading system ..."
line
upgrade_system
line

echo "install chef"
line
install_chef
line

echo "install sezame_otvori_se.pub -> admin@~/.ssh/authorized_keys"
line
install_pub_key
line

echo "boostrap chef is finished :)"
