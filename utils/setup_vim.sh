#!/bin/bash

sudo yum install mercurial -y

sudo yum install ncurses-devel -y

cd /usr/local/src

hg clone https://vim.googlecode.com/hg/ vim

cd /usr/local/src/vim

./configure --enable-multibyte --with-features=huge --disable-selinux --prefix=/usr/local

make

make install

