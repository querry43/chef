#!/bin/bash

set -e

letsencrypt -v certonly --standalone \
    -d underdogma.net \
    -d test.underdogma.net \
    -d www.underdogma.net \
    -d users.underdogma.net \
    -d wrecked.underdogma.net
