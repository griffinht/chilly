#!/bin/sh

# https://www.talos.dev/v1.7/talos-guides/configuration/editing-machine-configuration/

jsonnet controlplane.json \
    | talosctl apply-config \
    --file /dev/stdin \
    --mode=try
