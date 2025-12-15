# azure-ipam

Azure VNET IPAM plugins manage IP address assignments to containers

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#azure-ipam

# Load into Docker
nix build .#load-azure-ipam-to-docker && ./result/bin/load-azure-ipam-to-docker
```
