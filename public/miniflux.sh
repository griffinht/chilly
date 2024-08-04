#!/bin/sh

set -xe

read -r postgres_password

host=100.79.87.2
database_url="user=miniflux password=$postgres_password dbname=miniflux sslmode=require host=$host"

kubectl create secret generic miniflux \
        --from-literal=DATABASE_URL="$database_url" \
        --dry-run=client \
        -o yaml \
        | kubectl apply -f -
