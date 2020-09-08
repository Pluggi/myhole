#!/bin/bash

set -euxo pipefail

exec dhcpd -4 -f -d --no-pid -cf /etc/dhcpd.conf -lf /tmp/dhcpd.leases
