# crossplane-sql

A Crossplane provider for SQL

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-sql

# Load into Docker
nix build .#load-crossplane-sql-to-docker && ./result/bin/load-crossplane-sql-to-docker
```
