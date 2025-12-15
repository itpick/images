# cluster-api-vsphere-controller-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-vsphere-controller-fips

# Load into Docker
nix build .#load-cluster-api-vsphere-controller-fips-to-docker && ./result/bin/load-cluster-api-vsphere-controller-fips-to-docker
```
