# go-msft-fips

Container image for building Go applications with FIPS

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#go-msft-fips

# Load into Docker
nix build .#load-go-msft-fips-to-docker && ./result/bin/load-go-msft-fips-to-docker
```
