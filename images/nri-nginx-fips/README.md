# nri-nginx-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-nginx-fips

# Load into Docker
nix build .#load-nri-nginx-fips-to-docker && ./result/bin/load-nri-nginx-fips-to-docker
```
