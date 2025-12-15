# nri-mssql-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#nri-mssql-fips

# Load into Docker
nix build .#load-nri-mssql-fips-to-docker && ./result/bin/load-nri-mssql-fips-to-docker
```
