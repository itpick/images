# thanos-operator-fips

Minimal FIPS image with the thanos-operator for managing Thanos components in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#thanos-operator-fips

# Load into Docker
nix build .#load-thanos-operator-fips-to-docker && ./result/bin/load-thanos-operator-fips-to-docker
```
