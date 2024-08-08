#!/bin/sh

selector="$1"
shift
ls -- "$selector" | xargs -I {} jsonnet {} | kubectl -f - "$@"
