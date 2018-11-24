#!/bin/bash

set -ueo pipefail

letsencrypt certonly \
    --test-cert \
    --agree-tos \
    -n \
    -m querry43@gmail.com \
    --standalone \
    -d underdogma.net \
    -d test.underdogma.net \
    -d www.underdogma.net \
    -d users.underdogma.net \
    -d wrecked.underdogma.net
