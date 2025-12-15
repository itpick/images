# cloud-provider-azure-node-manager

Controller manager for Azure CLI

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cloud-provider-azure-node-manager

# Load into Docker
nix build .#load-cloud-provider-azure-node-manager-to-docker && ./result/bin/load-cloud-provider-azure-node-manager-to-docker
```
