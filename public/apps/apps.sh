#!/usr/bin/env bash

set -exo pipefail

jsonnet deploy.json | KUBECTL_APPLYSET=true kubectl apply --warnings-as-errors -f - --prune --applyset=apps --namespace=default
