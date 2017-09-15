#!/bin/bash

GIT_TARGET_VERSION="git-2.14.1"
ARCHIVED_GIT_FILE_NAME="${GIT_TARGET_VERSION}.tar.gz"
GIT_URL="https://www.kernel.org/pub/software/scm/git/${ARCHIVED_GIT_FILE_NAME}"

echo "install git dependent libs..."
sudo yum install -y zlib-devel perl-devel gettext gcc curl-devel

echo "get git source..."
wget ${GIT_URL} -O /tmp/${ARCHIVED_GIT_FILE_NAME}

echo "decompress ${ARCHIVED_GIT_FILE_NAME}..."
tar -xvzf /tmp/${ARCHIVED_GIT_FILE_NAME} -C /tmp/

echo "git compile..."
cd /tmp/${GIT_TARGET_VERSION}
./configure
make
sudo make install

# create synbolic link /usr/bin/git to /usr/local/bin/git"
echo "create symbolic link to git..."
sudo ln -s /usr/local/bin/git /usr/bin/git
