# postgres-iamguarded-fips

PostgreSQL is a powerful, open source object-relational database system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-iamguarded-fips

# Load into Docker
nix build .#load-postgres-iamguarded-fips-to-docker && ./result/bin/load-postgres-iamguarded-fips-to-docker
```
