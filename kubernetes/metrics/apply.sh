#!/usr/bin/env bash

set -exo pipefail

# todo improve concurrency somehow?
#https://stackoverflow.com/questions/28357997/running-programs-in-parallel-using-xargs

apply() {
    applyset="${1?specify an applyset name}"
    jsonnet "$applyset.json" | KUBECTL_APPLYSET=true kubectl apply --warnings-as-errors -f - --prune --applyset="$applyset" --namespace=default
    #jsonnet "$applyset" | kubectl delete --warnings-as-errors -f - --namespace=default
}

apply "$@"
