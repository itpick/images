# cluster-proportional-autoscaler-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cluster-proportional-autoscaler-fips

# Load into Docker
nix build .#load-cluster-proportional-autoscaler-fips-to-docker && ./result/bin/load-cluster-proportional-autoscaler-fips-to-docker
```
