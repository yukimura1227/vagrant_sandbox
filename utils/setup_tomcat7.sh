#!/bin/bash

BASE_DIR="/vagrant"
PACKAGE_DIR="${BASE_DIR}/package"
TOMCAT_MAJOR_VERSION=7
TOMCAT_VERSION=${TOMCAT_MAJOR_VERSION}.0.67
TOMCAT_FILE_NAME="apache-tomcat-${TOMCAT_VERSION}"
ARCHIVED_TOMCAT_FILE_NAME="apache-tomcat-${TOMCAT_VERSION}.tar.gz"
TOMCAT_URL="http://ftp.meisei-u.ac.jp/mirror/apache/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_VERSION}/bin/${ARCHIVED_TOMCAT_FILE_NAME}"
USR_LOCAL_DIR="/usr/local/"
CATALINA_HOME="${USR_LOCAL_DIR}/tomcat${TOMCAT_MAJOR_VERSION}"
TOMCAT_REAL_PATH="${USR_LOCAL_DIR}/${TOMCAT_FILE_NAME}"


# create dir
if [ ! -d ${PACKAGE_DIR} ]
then
  mkdir -p ${PACKAGE_DIR}
else
  echo "${PACKAGE_DIR} Is Already Exists So Need Not Create"
fi

# if "archived tomcat file" is noting
if [ ! -f ${PACKAGE_DIR}/${ARCHIVED_TOMCAT_FILE_NAME} ]
then
  wget ${TOMCAT_URL} -O ${PACKAGE_DIR}/${ARCHIVED_TOMCAT_FILE_NAME}
else
  echo "${ARCHIVED_TOMCAT_FILE_NAME} Is Already Exists So Need Not wget"
fi

# gunzip "archived tomcat file"
if [ ! -d ${TOMCAT_REAL_PATH} ]
then
  cp -p ${PACKAGE_DIR}/${ARCHIVED_TOMCAT_FILE_NAME} /tmp/${ARCHIVED_TOMCAT_FILE_NAME}
  tar -xvzf /tmp/${ARCHIVED_TOMCAT_FILE_NAME} -C ${USR_LOCAL_DIR}
  sudo ln -s ${TOMCAT_REAL_PATH} ${CATALINA_HOME}
  sudo chown -R vagrant:vagrant ${CATALINA_HOME}
else
  echo "${CATALINA_HOME} Is Already Exists"
fi

# copy setenv.sh
echo "copy setenv.sh"
sudo cp -p /vagrant/confs/tomcat/setenv.sh ${CATALINA_HOME}/bin
sudo chown -R vagrant:vagrant ${CATALINA_HOME}/

# setup tomcat init script
echo "copy /etc/init.d/tomcat"
sudo cp -p /vagrant/confs/tomcat/tomcat /etc/init.d/
sudo chown vagrant:vagrant /etc/init.d/tomcat

sudo /etc/init.d/tomcat start

sudo service iptables stop
