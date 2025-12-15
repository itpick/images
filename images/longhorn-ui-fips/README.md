# longhorn-ui-fips

A lightweight, reliable distributed block storage system for Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#longhorn-ui-fips

# Load into Docker
nix build .#load-longhorn-ui-fips-to-docker && ./result/bin/load-longhorn-ui-fips-to-docker
```
