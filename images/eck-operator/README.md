# eck-operator

Elastic Cloud on Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 7s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#eck-operator

# Load into Docker
nix build .#load-eck-operator-to-docker && ./result/bin/load-eck-operator-to-docker
```
