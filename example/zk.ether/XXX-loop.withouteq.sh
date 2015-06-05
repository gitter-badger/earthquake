#!/bin/bash
set -e # exit on error
set -x

while :;
do
    ./501-start-containers.sh
    ./502-set-pipework.sh
    ./503-start-zk.sh
    sleep 5
    ./802-check-leaders.py --wait
    ./601-reconfig.sh
    ./802-check-leaders.py --wait --foo-bar-this-is-a-dummy-arg-for-grepping
    ./901-kill-containers.sh
    sleep 10
done
