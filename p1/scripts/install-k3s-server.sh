#!/bin/sh

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --flannel-backend none --node-ip "192.168.56.110" --bind-address "192.168.56.110" --agent-token 12345" sh -s -
