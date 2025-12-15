# nri-mongodb-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-mongodb-fips

# Load into Docker
nix build .#load-nri-mongodb-fips-to-docker && ./result/bin/load-nri-mongodb-fips-to-docker
```
