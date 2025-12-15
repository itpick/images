# pgbouncer

This image contains the CLI for the pgbouncer connection pooler for PostgreSQL. This image contains the pgbouncer binary and can be used directly

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#pgbouncer

# Load into Docker
nix build .#load-pgbouncer-to-docker && ./result/bin/load-pgbouncer-to-docker
```
