# nri-f5-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-f5-fips

# Load into Docker
nix build .#load-nri-f5-fips-to-docker && ./result/bin/load-nri-f5-fips-to-docker
```
