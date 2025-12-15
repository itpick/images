# kube-downscaler

Minimal image with kube-downscaler, scale down Kubernetes deployments after work hours

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-downscaler

# Load into Docker
nix build .#load-kube-downscaler-to-docker && ./result/bin/load-kube-downscaler-to-docker
```
