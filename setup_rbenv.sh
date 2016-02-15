#!/bin/bash

RBENV_INSTALL_DEST_DIR=/usr/local/rbenv
COMMON_BASH_SETTING_FILE=/etc/profile

echo "install gcc..."
sudo yum -y install gcc

echo "install openssl-devel..."
sudo yum -y install openssl-devel

echo "instal readline-devel..."
yum install -y readline-devel

which git
if [ $? -ne 0 ]
  echo "install git..."
  sudo yum -y install git
fi

echo "download rbenv..."
git clone https://github.com/sstephenson/rbenv.git ${RBENV_INSTALL_DEST_DIR}

# add rbenv path To $PATH
echo "append rbenv path info To ${COMMON_BASH_SETTING_FILE}..."
echo "export RBENV_ROOT=\"${RBENV_INSTALL_DEST_DIR}\"" >> ${COMMON_BASH_SETTING_FILE}
echo 'export PATH="${RBENV_ROOT}/bin:$PATH"' >> ${COMMON_BASH_SETTING_FILE}
echo 'eval "$(rbenv init -)"' >> ${COMMON_BASH_SETTING_FILE}

# ${COMMON_BASH_SETTING_FILE} reload
echo "${COMMON_BASH_SETTING_FILE} reload"
source ${COMMON_BASH_SETTING_FILE}

echo "download rbenv plugin(ruby-build)..."
git clone https://github.com/sstephenson/ruby-build.git ${RBENV_INSTALL_DEST_DIR}/plugins/ruby-build

# install ruby
echo "ruby install..."
TARGET_RUBY_VERSION="2.1.2"
rbenv install -v ${TARGET_RUBY_VERSION}

rbenv global ${TARGET_RUBY_VERSION}

rbenv rehash

# set rbenv owner
chown -R vagrant:vagrant ${RBENV_INSTALL_DEST_DIR}
