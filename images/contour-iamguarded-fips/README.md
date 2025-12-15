# contour-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#contour-iamguarded-fips

# Load into Docker
nix build .#load-contour-iamguarded-fips-to-docker && ./result/bin/load-contour-iamguarded-fips-to-docker
```
