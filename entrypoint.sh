#!/bin/bash

echo "expect kengen.exp"
expect keygen.exp
mkdir -p ./ssh
cat ~/.ssh/id_rsa.pub >> ./ssh/authorized_keys
echo "expect known_hosts.exp"
expect known_hosts.exp $HOST_USER $HOST_NAME

tail -f /var/log/bootstrap.log

