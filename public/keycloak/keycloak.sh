#!/bin/sh

set -xe

read -r password

kubectl create secret generic keycloak \
    --from-literal=KC_DB_PASSWORD="$password" \
    --dry-run=client \
    -o yaml \
    | kubectl apply -f -
