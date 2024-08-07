#!/bin/sh

set -xe
# todo detect failed rollout
# kubectl rollout history deployment/caddy 
# kubectl rollout undo deployment/caddy --to-revision=3

if ! kubectl rollout status deployment/caddy --timeout=20s; then
    kubectl rollout undo deployment/caddy
fi
