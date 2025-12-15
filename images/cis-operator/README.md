# cis-operator

Enables running CIS benchmark security scans on a Kubernetes cluster and generates compliance reports that can be downloaded

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cis-operator

# Load into Docker
nix build .#load-cis-operator-to-docker && ./result/bin/load-cis-operator-to-docker
```
