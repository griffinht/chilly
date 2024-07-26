#!/bin/sh

set -xe

context=gke_chilly-429823_us-east1_public

old_context="$(kubectl config current-context)"
cleanup() {
    kubectl config set-context "$old_context"
}
trap cleanup EXIT

kubectl config set-context "$context"

make deploy
