# multus-cni-fips

A CNI meta-plugin for multi-homed pods in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#multus-cni-fips

# Load into Docker
nix build .#load-multus-cni-fips-to-docker && ./result/bin/load-multus-cni-fips-to-docker
```
