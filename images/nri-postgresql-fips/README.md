# nri-postgresql-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-postgresql-fips

# Load into Docker
nix build .#load-nri-postgresql-fips-to-docker && ./result/bin/load-nri-postgresql-fips-to-docker
```
