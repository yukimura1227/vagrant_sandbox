#!/bin/bash

curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -

echo "setup yarn repository"
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum -y install yarn
