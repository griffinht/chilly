jsonnet -V key="$(cat key.json)" - > key_bruh.json << EOF
{
    "service_account.json": std.extVar("key")
}
EOF

