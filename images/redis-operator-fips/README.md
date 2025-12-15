# redis-operator-fips

A FIPS-compliant redis-operator image that automates Redis cluster deployment, scaling, and management in Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#redis-operator-fips

# Load into Docker
nix build .#load-redis-operator-fips-to-docker && ./result/bin/load-redis-operator-fips-to-docker
```
