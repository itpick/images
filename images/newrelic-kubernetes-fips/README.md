# newrelic-kubernetes-fips

FIPS-compliant minimal newrelic-kubernetes container image

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-kubernetes-fips

# Load into Docker
nix build .#load-newrelic-kubernetes-fips-to-docker && ./result/bin/load-newrelic-kubernetes-fips-to-docker
```
