#!/bin/bash

top=$(readlink -f $(dirname $0))

sudo chef-solo -c "$top/solo.rb"
