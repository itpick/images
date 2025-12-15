# nri-apache-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-apache-fips

# Load into Docker
nix build .#load-nri-apache-fips-to-docker && ./result/bin/load-nri-apache-fips-to-docker
```
