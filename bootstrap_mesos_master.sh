#!/usr/bin/env bash

set -e

ID=$1

apt-get install -y mesosphere
#echo "zk://192.168.50.71:2181,192.168.50.72:2181,192.168.50.73:2181/mesos" >/etc/mesos/zk
    echo "zk://192.168.50.71:2181/mesos" >/etc/mesos/zk
echo $ID >/etc/zookeeper/conf/myid
#echo "server.1=192.168.50.71:2888:3888
#server.2=192.168.50.72:2888:3888
#server.3=192.168.50.73:2888:3888" >/etc/zookeeper/conf/zoo.cfg
echo "server.1=192.168.50.71:2888:3888" >/etc/zookeeper/conf/zoo.cfg
#echo "2" >/etc/mesos-master/quorum
echo 192.168.50.7$ID | tee /etc/mesos-master/ip
cp /etc/mesos-master/ip /etc/mesos-master/hostname
mkdir -p /etc/marathon/conf
cp /etc/mesos-master/hostname /etc/marathon/conf
cp /etc/mesos/zk /etc/marathon/conf/master
cp /etc/marathon/conf/master /etc/marathon/conf/zk
sed -i 's/mesos/marathon/g' /etc/marathon/conf/zk
echo manual | tee /etc/init/mesos-slave.override
restart zookeeper
start mesos-master
start marathon
# curl http://192.168.50.71:5050
# curl http://192.168.50.71:8080