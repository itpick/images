# kube-logging-operator-fluentd

Kubernetes Logging Operator Fluentd Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-logging-operator-fluentd

# Load into Docker
nix build .#load-kube-logging-operator-fluentd-to-docker && ./result/bin/load-kube-logging-operator-fluentd-to-docker
```
