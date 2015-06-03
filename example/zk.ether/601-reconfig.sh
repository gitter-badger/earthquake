#!/bin/bash
ZK=../zk/zookeeper

$ZK/bin/zkCli.sh -server 192.168.42.1 sync /

$ZK/bin/zkCli.sh -server 192.168.42.1 reconfig -add server.2=192.168.42.2:2888:3888\;2181 &
$ZK/bin/zkCli.sh -server 192.168.42.1 reconfig -add server.3=192.168.42.3:2888:3888\;2181


$ZK/bin/zkCli.sh -server 192.168.42.1 config
