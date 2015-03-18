#!/bin/bash

echo "Installing Ansible..."
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible
echo "Installing git..."
apt-get install -y git
echo "Installing Docker..."
apt-get install -y docker.io python-pip
pip install docker-py==0.4.0
echo "Installing Kubernetes..."
cd /vagrant
git clone https://github.com/GoogleCloudPlatform/kubernetes.git
cd /vagrant/kubernetes/cluster/ubuntu-cluster
./build.sh
mkdir -p /opt/bin
cp /vagrant/kubernetes/cluster/ubuntu-cluster/binaries/* /opt/bin