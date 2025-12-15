# whereabouts

Whereabouts is a simple IPAM (IP Address Management) solution for Kubernetes. To get more information about Whereabouts, please visit the official project repository

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#whereabouts

# Load into Docker
nix build .#load-whereabouts-to-docker && ./result/bin/load-whereabouts-to-docker
```
