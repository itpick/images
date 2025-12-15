# pgbouncer-iamguarded

This image contains the CLI for the pgbouncer connection pooler for PostgreSQL with IAMGuarded support

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgbouncer-iamguarded

# Load into Docker
nix build .#load-pgbouncer-iamguarded-to-docker && ./result/bin/load-pgbouncer-iamguarded-to-docker
```
