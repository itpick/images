# longhorn-share-manager

A lightweight, reliable distributed block storage system for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#longhorn-share-manager

# Load into Docker
nix build .#load-longhorn-share-manager-to-docker && ./result/bin/load-longhorn-share-manager-to-docker
```
