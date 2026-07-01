# contour-nixchart-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#contour-nixchart-fips

# Load into Docker
nix build .#load-contour-nixchart-fips-to-docker && ./result/bin/load-contour-nixchart-fips-to-docker
```
