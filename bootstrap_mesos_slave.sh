#!/usr/bin/env bash

apt-get install -y mesos
#echo "zk://192.168.50.71:2181,192.168.50.72:2181,192.168.50.73:2181/mesos" >/etc/mesos/zk
echo "zk://192.168.50.71:2181/mesos" >/etc/mesos/zk