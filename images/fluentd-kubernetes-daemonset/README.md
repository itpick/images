# fluentd-kubernetes-daemonset

Wolfi-based images that provide Fluentd DaemonSets for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluentd-kubernetes-daemonset

# Load into Docker
nix build .#load-fluentd-kubernetes-daemonset-to-docker && ./result/bin/load-fluentd-kubernetes-daemonset-to-docker
```
