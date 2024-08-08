#!/bin/sh

echo specify instance number
read -r number

hcloud server create --name "talos-control-plane-$number" \
    --image 180312599 \
    --type cpx11 --location ash \
    --network network-1 \
    --label 'type=controlplane' \
    --user-data-from-file controlplane.yaml #\
#    --without-ipv4
