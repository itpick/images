# cluster-api-provider-vsphere

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-provider-vsphere

# Load into Docker
nix build .#load-cluster-api-provider-vsphere-to-docker && ./result/bin/load-cluster-api-provider-vsphere-to-docker
```
