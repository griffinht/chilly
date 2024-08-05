#!/bin/sh

set -xe

echo TODO MAKE SURE YOUR PASSWORD DOESN\'T HAVE SPECIAL CHARS
read -r postgres_password

# corresponds to postgres in my tailnet
# dns doesn't really work with sidecar containers
# todo it should work shouldn't it!?
# https://github.com/tailscale/tailscale/issues/6179
database_url="user=miniflux password=$postgres_password dbname=miniflux sslmode=disable host=localhost"

kubectl create secret generic miniflux \
        --from-literal=DATABASE_URL="$database_url" \
        --dry-run=client \
        -o yaml \
        | kubectl apply -f -
