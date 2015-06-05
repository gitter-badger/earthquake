#!/bin/bash
set -e
set -x

ZK=../zk/zookeeper

echo '=== CREATE HOGE ==='
$ZK/bin/zkCli.sh -server 192.168.42.3 create /hoge fubar

echo '=== SYNC & RECONFIG ==='
$ZK/bin/zkCli.sh -server 192.168.42.1 reconfig -add server.2=192.168.42.2:2888:3888\;2181
$ZK/bin/zkCli.sh -server 192.168.42.3 create /fuga barfu
$ZK/bin/zkCli.sh -server 192.168.42.3 sync / &
$ZK/bin/zkCli.sh -server 192.168.42.1 reconfig -add server.3=192.168.42.3:2888:3888\;2181 &


echo '=== WAIT ==='
sleep 10

echo '=== GET CONFIG ==='
$ZK/bin/zkCli.sh -server 192.168.42.1 config

echo '=== GET HOGE ==='
$ZK/bin/zkCli.sh -server 192.168.42.1 get /hoge
$ZK/bin/zkCli.sh -server 192.168.42.1 get /fuga
