#!/bin/bash

name=$1; shift
image=$1; shift
args=$@

function stop {
    docker stop -t 10 $name 2> /dev/null
    docker rm -f $name 2> /dev/null
}

trap stop SIGHUP SIGINT SIGTERM
stop

docker run --name $name -a stdout -a stderr --rm=true $args $image &

sleep 5

container_pid=$(docker inspect --format '{{.State.Pid}}' $name)

while $(true); do
    sleep 5
    if ! ps $container_pid &> /dev/null; then
        stop
        exit 1
    fi
done
