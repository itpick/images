# kapp-controller

Continuous delivery and package management for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kapp-controller

# Load into Docker
nix build .#load-kapp-controller-to-docker && ./result/bin/load-kapp-controller-to-docker
```
