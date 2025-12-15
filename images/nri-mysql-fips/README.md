# nri-mysql-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-mysql-fips

# Load into Docker
nix build .#load-nri-mysql-fips-to-docker && ./result/bin/load-nri-mysql-fips-to-docker
```
