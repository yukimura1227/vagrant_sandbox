#!/bin/bash

GEM_PATH="/usr/local/rbenv/shims/gem"

echo "stop iptables..."
sudo service iptables stop

echo "installing sqlite-devel..."
sudo yum install sqlite-devel -y

echo "installing gcc-c++..."
sudo yum install gcc-c++ -y

echo "installing phantmjs..."
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar jxfv phantomjs-2.1.1-linux-x86_64.tar.bz2
mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
sudo yum -y install fontconfig-devel

echo "${GEM_PATH} install rails..."
su - vagrant -c "${GEM_PATH} install --no-document rails -v '5.1.3'"

