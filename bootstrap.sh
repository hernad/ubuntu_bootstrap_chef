#!/bin/bash

# https://gist.github.com/2775351

# http://www.wolfe.id.au/2012/09/10/how-i-use-chef-solo-with-ubuntu-12.04/

# ovaj mi pase
# https://gist.github.com/3328844

AUTHOR="Ernad Husremovic"
VERSION="0.9.5"
DATE="09.11.2012"
LICENSE="MIT"

ADMIN_USER=root
HOME_DIR=/root


#GITHUB_PROJECT=vagrant_gitlab
#if [[ -z "$GITHUB_USER" || -z "$GITHUB_PROJECT" ]]; then
#  echo "GITHUB_USER=$GITHUB_USER, GITHUB_PROJECT=$GITHUB_PROJECT - definisati ove environment varijable"
#  exit 1
#fi


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

function install_cookbook {

GITHUB_URL=git://github.com/$GITHUB_USER/$GITHUB_PROJECT.git

cd /root
git clone $GITHUB_URL

cd $GITHUB_PROJECT
./run_solo.rb

}



# --------- start app ---------------------
header

echo "upgrading system ..."
line
#upgrade_system
line

echo "install chef"
line
#install_chef
line

echo "install cookbook"
line
install_cookbook
line


echo "boostrap chef for $GITHUB_PROJECT is finished ($VERSION) :)"
