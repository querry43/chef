#!/bin/bash

set -e

if ! which chef-solo > /dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    # Install Ruby and Chef
    sudo aptitude install -y ruby2.0 ruby2.0-dev make libyajl-dev gcc git
    sudo gem2.0 install --no-rdoc --no-ri chef
fi

git clone git@github.com:querry43/chef.git

cd chef
./run.sh
