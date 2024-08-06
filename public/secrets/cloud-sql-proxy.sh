#!/bin/sh

#gcloud iam service-accounts keys create key.json \
#    --iam-account=postgres@chilly-429823.iam.gserviceaccount.com
kubectl create secret generic postgres \
    --from-file=service_account.json=cloud-sql-proxy.sh \
    --dry-run=client \
    -o yaml
#rm key.json
