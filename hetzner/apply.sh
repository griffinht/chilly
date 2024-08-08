#!/bin/sh

set -e

# https://www.talos.dev/v1.7/talos-guides/configuration/editing-machine-configuration/

jsonnet controlplane.json \
    | talosctl apply-config \
    --file /dev/stdin \
    --dry-run

try() {
    jsonnet controlplane.json \
        | talosctl apply-config \
        --file /dev/stdin \
        --mode=try
}

apply() {
    jsonnet controlplane.json \
        | talosctl apply-config \
        --file /dev/stdin \
        --mode=no-reboot
}

echo continue with "$@" ?
read -r test

"$@"
