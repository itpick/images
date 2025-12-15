# cluster-api-fips-1.9-clusterctl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-fips-1.9-clusterctl

# Load into Docker
nix build .#load-cluster-api-fips-1.9-clusterctl-to-docker && ./result/bin/load-cluster-api-fips-1.9-clusterctl-to-docker
```
