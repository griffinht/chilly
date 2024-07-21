#!/bin/sh

set -xe

# https://oauth2-proxy.github.io/oauth2-proxy/configuration/overview
cookie_secret() {
    dd if=/dev/urandom bs=32 count=1 2>/dev/null | base64 | tr -d -- '\n' | tr -- '+/' '-_'
}

read -r client_secret

kubectl create secret generic oauth2-proxy \
        --from-literal=OAUTH2_PROXY_COOKIE_SECRET="$(cookie_secret)" \
        --from-literal=OAUTH2_PROXY_CLIENT_SECRET="$client_secret" \
        --dry-run=client \
        -o yaml \
        | kubectl apply -f -
