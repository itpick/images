# helm-operator-fips

open source toolkit to manage Kubernetes native applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#helm-operator-fips

# Load into Docker
nix build .#load-helm-operator-fips-to-docker && ./result/bin/load-helm-operator-fips-to-docker
```
