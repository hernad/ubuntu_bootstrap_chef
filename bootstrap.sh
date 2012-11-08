#!/bin/bash

# https://gist.github.com/2775351

# http://www.wolfe.id.au/2012/09/10/how-i-use-chef-solo-with-ubuntu-12.04/

# ovaj mi pase
# https://gist.github.com/3328844

GITHUB_USER=hernad
ADMIN_USER=admin
HOME_DIR=/home/$ADMIN_USER
# http://www.wolfe.id.au/2012/09/10/how-i-use-chef-solo-with-ubuntu-12.04/

#bash < <( curl -L https://raw.github.com/gist/73344/vakonako )

# http://serverfault.com/questions/58378/add-new-user-with-root-access-in-linux


# run as root with:
# curl -L https://raw.github.com/hernad/ubuntu_bootstrap_chef/master/bootstrap.sh  | bash

function create_admin_user {
  useradd $ADMIN_USER -m -s /bin/bash
  usermod -a -G adm
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
mkdir -p $HOME_DIR/.ssh && chown admin:admin
chown 0600 /home/admin/.ssh

pub_key=$( curl -L https://raw.github.com/$GITHUB_USER/ubuntu_bootstrap_chef/master/sezame_otvori_se.pub )

cat "$pub_key" >> $HOME_DIR/.ssh/autorized_keys

}

function line {
echo "----------------------------------------"
}

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
