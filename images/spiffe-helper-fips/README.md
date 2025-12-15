# spiffe-helper-fips

A secure, minimal container image for the SPIFFE Helper utility that automates X.509 SVID certificate rotation for services that can't natively fetch X.509-SVIDs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#spiffe-helper-fips

# Load into Docker
nix build .#load-spiffe-helper-fips-to-docker && ./result/bin/load-spiffe-helper-fips-to-docker
```
