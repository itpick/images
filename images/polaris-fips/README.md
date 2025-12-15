# polaris-fips

FIPS-compliant version of Polaris. Polaris is an open source policy engine for Kubernetes that validates and remediates resource configuration

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#polaris-fips

# Load into Docker
nix build .#load-polaris-fips-to-docker && ./result/bin/load-polaris-fips-to-docker
```
