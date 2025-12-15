# crossplane-provider-azure

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-azure

# Load into Docker
nix build .#load-crossplane-provider-azure-to-docker && ./result/bin/load-crossplane-provider-azure-to-docker
```
