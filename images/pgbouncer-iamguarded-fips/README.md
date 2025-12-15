# pgbouncer-iamguarded-fips

This image contains the CLI for the pgbouncer connection pooler for PostgreSQL with IAMGuarded support

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgbouncer-iamguarded-fips

# Load into Docker
nix build .#load-pgbouncer-iamguarded-fips-to-docker && ./result/bin/load-pgbouncer-iamguarded-fips-to-docker
```
