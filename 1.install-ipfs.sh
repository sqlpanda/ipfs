#!/usr/bin/env bash

set -e

# ipfs daemon
if [ -e /usr/local/bin/ipfs ]
then
	ipfs version
else
	wget https://dist.ipfs.io/go-ipfs/v0.4.15/go-ipfs_v0.4.15_linux-amd64.tar.gz
	tar xvfz go-ipfs_v0.4.15_linux-amd64.tar.gz
	rm go-ipfs_v0.4.15_linux-amd64.tar.gz
	mv go-ipfs/ipfs /usr/local/bin
	rm -rf go-ipfs
fi

# ipfs cluster service
if [ -e /usr/local/bin/ipfs-cluster-service ]
then
	ipfs-cluster-service  -v
else
	wget https://dist.ipfs.io/ipfs-cluster-service/v0.4.0/ipfs-cluster-service_v0.4.0_linux-amd64.tar.gz
	tar xvfz ipfs-cluster-service_v0.4.0_linux-amd64.tar.gz
	rm ipfs-cluster-service_v0.4.0_linux-amd64.tar.gz
	mv ipfs-cluster-service/ipfs-cluster-service /usr/local/bin
	rm -rf ipfs-cluster-service
fi

# ipfs cluster ctl
if [ -e /usr/local/bin/ipfs-cluster-service ]
then
        ipfs-cluster-service  -v
else

	wget https://dist.ipfs.io/ipfs-cluster-ctl/v0.4.0/ipfs-cluster-ctl_v0.4.0_linux-amd64.tar.gz
	tar xvfz ipfs-cluster-ctl_v0.4.0_linux-amd64.tar.gz
	rm ipfs-cluster-ctl_v0.4.0_linux-amd64.tar.gz
	mv ipfs-cluster-ctl/ipfs-cluster-ctl /usr/local/bin
	rm -rf ipfs-cluster-ctl
fi

add-apt-repository ppa:certbot/certbot -y
apt-get update
apt-get install nginx software-properties-common python-certbot-nginx -y
systemctl status nginx

