# crossplane-sql-fips

A Crossplane provider for SQL FIPS version

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-sql-fips

# Load into Docker
nix build .#load-crossplane-sql-fips-to-docker && ./result/bin/load-crossplane-sql-fips-to-docker
```
