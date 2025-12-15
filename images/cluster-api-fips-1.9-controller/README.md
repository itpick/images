# cluster-api-fips-1.9-controller

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-api-fips-1.9-controller

# Load into Docker
nix build .#load-cluster-api-fips-1.9-controller-to-docker && ./result/bin/load-cluster-api-fips-1.9-controller-to-docker
```
