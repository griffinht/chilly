#!/bin/sh

set -xe

context=gke_chilly-429823_us-east1_public

old_context="$(kubectl config current-context)"
cleanup() {
    kubectl config use-context "$old_context"
}
trap cleanup EXIT

kubectl config use-context "$context"

kubectl config current-context

just deploy

cd jsonnet
just deploy

# todo should wait until changes have propogated from deploy - kubectl probably has a way to do that idk
code="$(curl -s -o /dev/null -w "%{http_code}" https://miniflux.chilly.griffinht.com/metrics)"
# todo should be 403
# but i can't test that because of authentication
if [ "$code" -ne 302 ]; then
    exit 1
fi
