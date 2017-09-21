#!/bin/bash

echo "create ~/.netrc skelton for github"

su - vagrant -c "cat <<- EOS >> ~/.netrc
machine github.com
login yukimura1227
password ~set_your_access_token~
EOS
"
