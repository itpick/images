# kube-logging-operator-config-reloader

Minimal Logging operator for Kubernetes Image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-logging-operator-config-reloader

# Load into Docker
nix build .#load-kube-logging-operator-config-reloader-to-docker && ./result/bin/load-kube-logging-operator-config-reloader-to-docker
```
