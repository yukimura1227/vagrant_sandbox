#!/bin/bash

echo "setup mysql rpm..."
# centos 6
sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
# centos7
# sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm

echo "install mysql..."
sudo yum -y install mysql mysql-devel mysql-server mysql-utilities

echo "mysql auto start setting..."
# centos 6
sudo chkconfig mysqld on
sudo /etc/init.d/mysqld start

# centos 7
# sudo systemctl enable mysqld
# sudo systemctl start mysqld
