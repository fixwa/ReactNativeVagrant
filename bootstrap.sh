#!/usr/bin/env bash
dpkg --configure -a
apt-add-repository ppa:brightbox/ruby-ng -y

apt-get update
apt-get upgrade
apt-get -u dist-upgrade
apt-get -f install
apt-get install -y zip
apt-get install -y yum
apt-get install -y git
apt-get remove ruby
apt-get remove nodejs
apt-get remove ^node-*
apt-get remove nodejs-*
apt-get install ruby2.3 ruby2.3-dev
apt-get autoremove
apt-get autoclean
gem update

wget -qO- https://deb.nodesource.com/setup_7.x | sudo bash -
apt-get install -y nodejs

rm -rf /usr/npm-global
mkdir /usr/npm-global
npm config set prefix /usr/npm-global --global
npm install -g create-react-native-app

chown -R nobody:nogroup /usr/npm-global
chmod -R 777 /usr/npm-global

echo "PATH=${PATH}:/usr/npm-global/bin" >> /home/vagrant/.profile
source /home/vagrant/.profile
