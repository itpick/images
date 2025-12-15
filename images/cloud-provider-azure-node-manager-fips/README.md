# cloud-provider-azure-node-manager-fips

FIPS Controller manager for Azure CLI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloud-provider-azure-node-manager-fips

# Load into Docker
nix build .#load-cloud-provider-azure-node-manager-fips-to-docker && ./result/bin/load-cloud-provider-azure-node-manager-fips-to-docker
```
