#!/bin/sh

set -xe
# todo detect failed rollout
# kubectl rollout history deployment/caddy 
# kubectl rollout undo deployment/caddy --to-revision=3

cleanup() {
    kubectl rollout undo deployment/caddy
}
trap cleanup EXIT

kubectl rollout status deployment/caddy --timeout=5s
