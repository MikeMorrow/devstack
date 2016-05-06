#!/bin/bash
cd /home/stack
# ---------------------------------------------------------------------------
# Setup clone repo & enter directory
# ---------------------------------------------------------------------------
git clone https://git.openstack.org/openstack-dev/devstack
cd devstack
# ---------------------------------------------------------------------------
# Setup local config
# ---------------------------------------------------------------------------
echo '[[local|localrc]]' > local.conf
echo ADMIN_PASSWORD=password >> local.conf
echo DATABASE_PASSWORD=password >> local.conf
echo RABBIT_PASSWORD=password >> local.conf
echo SERVICE_PASSWORD=password >> local.conf
echo FLOATING_RANGE=192.168.3.224/27 >> local.conf
echo FLAT_INTERFACE=enp0s8 >> local.conf
echo HOST_IP=192.168.3.50 >> local.conf
# ---------------------------------------------------------------------------
# Setup start openstack
# ---------------------------------------------------------------------------
/home/stack/devstack/stack.sh
