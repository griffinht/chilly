local Deployment(common) = {
  "apiVersion": "apps/v1",
  "kind": "Deployment",
  "metadata": {
    "name": common.name,
    "labels": {
      "app.kubernetes.io/name": common.name,
    }
  },
  "spec": {
    "selector": {
      "matchLabels": {
        "app.kubernetes.io/name": common.name,
      }
    },
    "template": {
      "metadata": {
        "labels": {
          "app.kubernetes.io/name": common.name,
        }
      },
      "spec": {
        containers: [
          {
            image: common.image,
            name: common.name,
            ports: common.ports,
            env: if 'env' in common then common.env else null,
            command: if 'command' in common then common.command else null,
            resources: if 'resources' in common then common.resources else {
              requests: {
                memory: "512Mi",
                cpu: "250m"
              }
            },
          }
        ]
      }
    }
  }
};

Deployment
