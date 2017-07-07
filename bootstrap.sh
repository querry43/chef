#!/bin/bash

set -e

cd /tmp

if ! which chef-solo > /dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    # Install Ruby and Chef
    sudo apt-get update
    sudo apt-get install -y ruby ruby-dev make libyajl-dev gcc git
    sudo gem install --no-rdoc --no-ri chef
fi

git clone https://github.com/querry43/chef.git

cd chef
sudo ./fetch-certs.sh
./run.sh
