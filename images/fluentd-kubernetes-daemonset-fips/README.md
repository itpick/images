# fluentd-kubernetes-daemonset-fips

Wolfi-based images that provide Fluentd DaemonSets for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluentd-kubernetes-daemonset-fips

# Load into Docker
nix build .#load-fluentd-kubernetes-daemonset-fips-to-docker && ./result/bin/load-fluentd-kubernetes-daemonset-fips-to-docker
```
