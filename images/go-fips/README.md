# go-fips

Container image for building Go applications with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#go-fips

# Load into Docker
nix build .#load-go-fips-to-docker && ./result/bin/load-go-fips-to-docker
```
