#!/bin/bash

echo "create ~/.netrc skelton for github"

su - vagrant -c "cat <<- EOS >> ~/.netrc
machine github.com
login ~set_your_github_user~
password ~set_your_access_token~
EOS
"
