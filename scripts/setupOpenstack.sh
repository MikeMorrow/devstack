#!/bin/bash

# ---------------------------------------------------------------------------
# Setup stack user
# ---------------------------------------------------------------------------
useradd stack
echo "stack        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/stack
echo 'Defaults:stack !requiretty' >> /etc/sudoers.d/stack
chown stack:stack /home/stack
# ---------------------------------------------------------------------------
# Install devstack
# ---------------------------------------------------------------------------
yum update -qy
yum install -qy git
sudo -u stack "/vagrant/scripts/installOpenstack.sh"
# ---------------------------------------------------------------------------
# Open iptables port -- insert rule at top
# ---------------------------------------------------------------------------
iptables -I INPUT 1 -p tcp -m tcp --dport 80 -j ACCEPT
