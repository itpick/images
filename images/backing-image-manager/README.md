# backing-image-manager

A lightweight, reliable distributed block storage system for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#backing-image-manager

# Load into Docker
nix build .#load-backing-image-manager-to-docker && ./result/bin/load-backing-image-manager-to-docker
```
