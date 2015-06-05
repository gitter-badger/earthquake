#!/bin/bash
set -e # exit on error
set -x

while :;
do
    ./501-start-containers.sh
    ./502-set-pipework.sh
    ./503-start-zk.sh
    sleep 5
    ./802-check-leaders.py
    ./601-reconfig.sh
    ./801-inspection-end.sh
    ./802-check-leaders.py
    ./901-kill-containers.sh
    sleep 10
done
