#!/bin/bash

set -euxo pipefail

UNBOUND_VERBOSITY="${UNBOUND_VERBOSITY:-1}"
UNBOUND_PORT="${UNBOUND_PORT:-5353}"

replace() {
	local pattern=$1
	local value=$2
	sed -i "s/${pattern}/${value}/" /etc/unbound/unbound.conf
}

replace UNBOUND_VERBOSITY "${UNBOUND_VERBOSITY}"
replace UNBOUND_PORT "${UNBOUND_PORT}"

unbound-checkconf
exec unbound
