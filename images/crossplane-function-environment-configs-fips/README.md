# crossplane-function-environment-configs-fips

Crossplane function that manages environment-specific configurations for resources in compositions with FIPS 140-3 compliance

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-function-environment-configs-fips

# Load into Docker
nix build .#load-crossplane-function-environment-configs-fips-to-docker && ./result/bin/load-crossplane-function-environment-configs-fips-to-docker
```
