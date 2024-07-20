credentials:
	gcloud container clusters get-credentials --location=us-east1 public

# make sure networking works idk
# basically this command should fail
# there should really be a better way to do this tho
test:
	kubectl exec -it searxng -- sh -c "wget -qO- --timeout=2 redlib > /dev/null"
