#!/usr/bin/env bash

sudo sed -i'' -e 's/^#GatewayPorts no/#GatewayPorts no\nGatewayPorts yes/' /etc/ssh/sshd_config
