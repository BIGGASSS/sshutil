#!/bin/bash

echo "export TERM="xterm-256color"" >> ~/.bashrc
apt update && apt install curl wget sudo

# Enable BBR
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_control
lsmod | grep bbr

# Configure SSH
bash <(curl -sL https://raw.githubusercontent.com/BIGGASSS/sshconfig/refs/heads/master/sshconfig.sh)