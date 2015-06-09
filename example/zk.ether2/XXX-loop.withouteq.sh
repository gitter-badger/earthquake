#!/bin/bash
set -e # exit on error
set -x

while :;
do
    ## make sure eq switch is killed
    ./501-start-containers.sh
    ./502-set-pipework.sh
    ./503-start-zk.sh
    sleep 5
    ./802-check.py
    ./901-kill-containers.sh
    sleep 10
done
