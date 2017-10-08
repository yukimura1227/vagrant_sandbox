#!/bin/bash

echo 'wget https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x64.tar.gz -O heroku.tar.gz'
wget https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x64.tar.gz -O heroku.tar.gz

echo 'tar -xvzf heroku.tar.gz'
tar -xvzf heroku.tar.gz

echo 'mkdir -p /usr/local/lib /usr/local/bin'
mkdir -p /usr/local/lib /usr/local/bin

echo 'mv heroku-cli-v*-linux-x64/ /usr/local/lib/heroku'
mv heroku-cli-v*-linux-x64/ /usr/local/lib/heroku

echo 'ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku'
ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku

