#!/bin/bash

set -euxo pipefail

BIND_FORWARDERS="${BIND_FORWARDERS:-8.8.8.8; 8.8.4.4;}"
BIND_ACL="${BIND_ACL:-localhost; localnets;}"

cat <<EOF > /etc/bind/named.conf
acl goodclients {
	${BIND_ACL}
};

options {
	listen-on port 5353 { 127.0.0.1; };
	listen-on-v6 { none; };

	directory "/var/cache/bind";

	dnssec-enable yes;
	dnssec-validation auto;

	auth-nxdomain no;    # conform to RFC1035

	recursion yes;
	#allow-query { goodclients; };

	forwarders { ${BIND_FORWARDERS} };
	forward only;

};
EOF

cat -n /etc/bind/named.conf

named-checkconf
exec named -g # -d 1
