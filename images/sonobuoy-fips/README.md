# sonobuoy-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sonobuoy-fips

# Load into Docker
nix build .#load-sonobuoy-fips-to-docker && ./result/bin/load-sonobuoy-fips-to-docker
```
