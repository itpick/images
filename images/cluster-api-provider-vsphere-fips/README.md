# cluster-api-provider-vsphere-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-provider-vsphere-fips

# Load into Docker
nix build .#load-cluster-api-provider-vsphere-fips-to-docker && ./result/bin/load-cluster-api-provider-vsphere-fips-to-docker
```
