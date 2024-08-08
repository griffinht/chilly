#!/usr/bin/env bash

set -xe

#https://github.com/yonahd/orphaned-configmaps

version="$(cat version)"
((version++))
echo "$version" > version

# todo kubepatch -> jsonnet
kubectl create configmap "caddy-v$version" \
    --from-file=Caddyfile \
    --dry-run=client -o yaml \
    | kubectl patch --local -o=yaml -p '{"immutable":true}' -f - \
    | kubectl apply -f -



#kubectl rollout undo deploy caddy --to-revision=9
