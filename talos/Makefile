test: controlplane.yaml.validate worker.yaml.validate
	echo hi

%.yaml.validate: %.yaml
	talosctl validate --config '$^' --mode cloud

servers:
	hcloud server list | grep control

bootstrap: talosconfig
	talosctl --talosconfig '$^' bootstrap
	touch '$@'

kubeconfig: bootstrap
	talosctl --talosconfig talosconfig '$@'
