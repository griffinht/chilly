#!/bin/sh

set -xe

read -r ts_authkey

kubectl create secret generic tailscale \
        --from-literal=TS_AUTHKEY="$ts_authkey" \
        --dry-run=client \
        -o yaml \
        | kubectl apply -f -
