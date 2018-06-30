#!/usr/bin/env bash
#export CLUSTER_SECRET=$(od  -vN 32 -An -tx1 /dev/urandom | tr -d ' \n')
#echo $CLUSTER_SECRET

set -e
#[ -z "$CLUSTER_SECRET" ] && echo "Need to set CLUSTER_SECRET" && exit 1;



echo 'export IPFS_PATH=/data/ipfs' >>~/.bash_profile
echo 'export IPFS_CLUSTER_PATH=/data/ipfs-cluster' >>~/.bash_profile

source ~/.bash_profile

# init ipfs
sudo mkdir -p $IPFS_PATH
sudo chown ubuntu:ubuntu $IPFS_PATH
# not sure about the permssion yet
#chown ec2-user:ec2-user $IPFS_PATH
ipfs init -p server
ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
ipfs config Datastore.StorageMax 10GB
ipfs config Addresses.Swarm '["/ip4/0.0.0.0/tcp/4001", "/ip4/0.0.0.0/tcp/8081/ws", "/ip6/::/tcp/4001"]' --json
ipfs config --bool Swarm.EnableRelayHop true
