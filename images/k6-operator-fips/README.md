# k6-operator-fips

FIPS-enabled Kubernetes operator for running distributed k6 performance tests

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k6-operator-fips

# Load into Docker
nix build .#load-k6-operator-fips-to-docker && ./result/bin/load-k6-operator-fips-to-docker
```
