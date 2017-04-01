#!/bin/sh

set -e

IFACE=${1:-eth2}
TARGET=${2:-"/etc/network-environment"}

IP=`ifconfig $IFACE | grep -m 1 inet | awk '{print $2}'`

echo "Creating ${TARGET} file with private networking configuration"

touch ${TARGET}

echo "PRIVATE_IPV4=${IP}" > ${TARGET}

/usr/bin/chmod +x /etc/network-environment

. /etc/network-environment
