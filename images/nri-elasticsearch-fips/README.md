# nri-elasticsearch-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-elasticsearch-fips

# Load into Docker
nix build .#load-nri-elasticsearch-fips-to-docker && ./result/bin/load-nri-elasticsearch-fips-to-docker
```
