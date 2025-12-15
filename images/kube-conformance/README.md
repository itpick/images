# kube-conformance

Minimal container image for running Kubernetes conformance tests

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-conformance

# Load into Docker
nix build .#load-kube-conformance-to-docker && ./result/bin/load-kube-conformance-to-docker
```
