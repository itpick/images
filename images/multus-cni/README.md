# multus-cni

A CNI meta-plugin for multi-homed pods in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#multus-cni

# Load into Docker
nix build .#load-multus-cni-to-docker && ./result/bin/load-multus-cni-to-docker
```
