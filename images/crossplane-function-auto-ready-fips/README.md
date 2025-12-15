# crossplane-function-auto-ready-fips

This composition function automatically detects when composed resources are ready in Crossplane

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-function-auto-ready-fips

# Load into Docker
nix build .#load-crossplane-function-auto-ready-fips-to-docker && ./result/bin/load-crossplane-function-auto-ready-fips-to-docker
```
