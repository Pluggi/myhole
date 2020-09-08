#!/bin/bash

set -euxo pipefail

DHCPD_LEASES=/tmp/dhcpd.leases

touch "${DHCPD_LEASES}"
exec dhcpd -user nobody -group nobody -4 -f -d --no-pid -cf /etc/dhcpd.conf -lf "${DHCPD_LEASES}"
