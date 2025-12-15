# flannel

Flannel is a network fabric for Kubernetes, providing a way to manage network configurations across a cluster

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#flannel

# Load into Docker
nix build .#load-flannel-to-docker && ./result/bin/load-flannel-to-docker
```
