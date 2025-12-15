# longhorn-ui

A lightweight, reliable distributed block storage system for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#longhorn-ui

# Load into Docker
nix build .#load-longhorn-ui-to-docker && ./result/bin/load-longhorn-ui-to-docker
```
