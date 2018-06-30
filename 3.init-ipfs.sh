#!/usr/bin/env bash

source ~/.bash_profile
echo $IPFS_PATH

# ipfs systemctl service
bash -c 'cat >/lib/systemd/system/ipfs.service <<EOL
[Unit]
Description=ipfs daemon
[Service]
ExecStart=/usr/local/bin/ipfs daemon --enable-gc --enable-pubsub-experiment
Restart=always
User=ubuntu
Group=ubuntu
Environment="IPFS_PATH=/data/ipfs"
[Install]
WantedBy=multi-user.target
EOL'

# enable the new services
systemctl daemon-reload
systemctl enable ipfs.service

systemctl start ipfs
systemctl status ipfs
