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
sudo -u stack "/vagrant/scripts/installOpenstack.stack"
# ---------------------------------------------------------------------------
# Open iptables port -- insert rule at top
# ---------------------------------------------------------------------------
iptables -I INPUT 1 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -I INPUT 1 -p tcp -m tcp --dport 8080 -j ACCEPT
/usr/libexec/iptables/iptables.init save
