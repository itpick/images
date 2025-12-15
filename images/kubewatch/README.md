# kubewatch

kubewatch is a Kubernetes watcher that publishes notification to available collaboration hubs/notification channels. Run it in your k8s cluster, and you will get event notifications through webhooks

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubewatch

# Load into Docker
nix build .#load-kubewatch-to-docker && ./result/bin/load-kubewatch-to-docker
```
