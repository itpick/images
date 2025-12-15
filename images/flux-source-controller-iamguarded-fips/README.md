# flux-source-controller-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-source-controller-iamguarded-fips

# Load into Docker
nix build .#load-flux-source-controller-iamguarded-fips-to-docker && ./result/bin/load-flux-source-controller-iamguarded-fips-to-docker
```
