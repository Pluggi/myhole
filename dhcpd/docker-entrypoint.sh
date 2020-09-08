#!/bin/bash

set -euxo pipefail

DHCPD_LEASES=/tmp/dhcpd.leases

touch "${DHCPD_LEASES}"
exec dhcpd -4 -f -d --no-pid -cf /etc/dhcpd.conf -lf "${DHCPD_LEASES}"
