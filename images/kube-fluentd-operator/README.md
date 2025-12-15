# kube-fluentd-operator

This image is used for the Kubernetes Fluentd Operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-fluentd-operator

# Load into Docker
nix build .#load-kube-fluentd-operator-to-docker && ./result/bin/load-kube-fluentd-operator-to-docker
```
