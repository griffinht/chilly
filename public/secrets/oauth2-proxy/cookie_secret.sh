#!/bin/sh

set -xe

# https://oauth2-proxy.github.io/oauth2-proxy/configuration/overview
cookie_secret() {
    dd if=/dev/urandom bs=32 count=1 2>/dev/null | base64 | tr -d -- '\n' | tr -- '+/' '-_'
}


jsonnet -V client_secret="$(cookie_secret)" - > cookie_secret.json << EOF
{
  OAUTH2_PROXY_COOKIE_SECRET: std.extVar("client_secret"),
}
EOF
