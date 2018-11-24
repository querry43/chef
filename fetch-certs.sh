#!/bin/bash

set -ueo pipefail

if ! which letsencrypt > /dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get install -y letsencrypt 
fi

letsencrypt -v certonly --standalone \
    -d underdogma.net \
    -d test.underdogma.net \
    -d www.underdogma.net \
    -d users.underdogma.net \
    -d wrecked.underdogma.net
