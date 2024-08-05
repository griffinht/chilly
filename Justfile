secret:
    gcloud iam service-accounts keys create key.json \
        --iam-account=postgres@chilly-429823.iam.gserviceaccount.com
    kubectl create secret generic postgres \
        --from-file=service_account.json=key.json
    rm key.json
