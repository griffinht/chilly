#!/usr/bin/env bash

#echo todo fix pod affinity
#exit 1

set -exo pipefail

# todo improve concurrency somehow?
#https://stackoverflow.com/questions/28357997/running-programs-in-parallel-using-xargs

jsonnet public.json | KUBECTL_APPLYSET=true kubectl apply --warnings-as-errors -f - --prune --applyset=test --namespace=default
#jsonnet public.json | kubectl delete --warnings-as-errors -f - --namespace=default
