# newrelic-infrastructure-bundle-fips

Minimal newrelic-infrastructure-bundle container image with FIPS-compliant cryptography

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-infrastructure-bundle-fips

# Load into Docker
nix build .#load-newrelic-infrastructure-bundle-fips-to-docker && ./result/bin/load-newrelic-infrastructure-bundle-fips-to-docker
```
