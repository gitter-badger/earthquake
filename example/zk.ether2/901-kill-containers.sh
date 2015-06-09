#!/bin/bash
set -x

mkdir /tmp/eq-zklog
LOGDIR=$(mktemp -d /tmp/eq-zklog/XXXXX)
for f in zk1 zk2 zk3; do docker cp $f:/log $LOGDIR/$f; done

docker rm -f zk1 zk2 zk3

sleep 5
garbages=$(ip a | egrep -o 'veth.*:' | sed -e s/://g)
for f in $garbages; do sudo ip link delete $f; done
