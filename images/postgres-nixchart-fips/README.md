# postgres-nixchart-fips

PostgreSQL is a powerful, open source object-relational database system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-nixchart-fips

# Load into Docker
nix build .#load-postgres-nixchart-fips-to-docker && ./result/bin/load-postgres-nixchart-fips-to-docker
```
