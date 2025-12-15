# gatekeeper-crds-fips

Minimal FIPS-compliant image for installing Gatekeeper Custom Resource Definitions (CRDs) in Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gatekeeper-crds-fips

# Load into Docker
nix build .#load-gatekeeper-crds-fips-to-docker && ./result/bin/load-gatekeeper-crds-fips-to-docker
```
