#!/bin/bash

set -e

letsencrypt certonly --standalone \
    -d underdogma.net \
    -d test.underdogma.net \
    -d www.underdogma.net \
    -d users.underdogma.net \
    -d slicer.underdogma.net
