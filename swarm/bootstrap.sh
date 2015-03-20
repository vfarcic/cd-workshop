#!/usr/bin/env bash

curl -sSL https://get.docker.com/ubuntu/ | sh

# Master
docker run --rm swarm create

# Node
CLUSTER_ID=f3edd7f9535cd50ee4c6ee7bc302bae3
NODE_IP=192.168.50.81
#echo "DOCKER_OPTS=\"-H 0.0.0.0:2375\"" >/etc/default/docker
#service docker restart
#sudo docker -H 0.0.0.0:2375 -d
docker run -H 0.0.0.0:2375 -d --name swarm-join swarm join --addr=$NODE_IP:2375 token://$CLUSTER_ID

# Master
CLUSTER_ID=f3edd7f9535cd50ee4c6ee7bc302bae3
docker run -d -p 2375:2375 --name swarm-manage swarm manage token://$CLUSTER_ID

docker -H tcp://0.0.0.0:2375 info

docker run --rm swarm list token://$CLUSTER_ID