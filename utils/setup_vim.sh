#!/bin/bash
which git
if [ $? -ne 0 ]
then
  echo "install git..."
  sudo yum -y install git
fi

which gcc
if [ $? -ne 0 ]
then
  echo 'install gcc'
  sudo yum -y install gcc
fi

yum list installed | grep ncurses-devel
if [ $? -eq 1 ]
then
  echo "install ncurses-devel and it's dependencies"
  sudo yum -y install ncurses-devel
  sudo yum -y install libXt-devel libX11-devel atk-devel gtk2-devel
fi

cd /usr/local/src

git clone https://github.com/vim/vim.git

cd /usr/local/src/vim/src

./configure --enable-multibyte --with-features=huge --disable-selinux --prefix=/usr/local

make

make install

