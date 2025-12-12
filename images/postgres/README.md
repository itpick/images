# postgres

Minimal image for PostgreSQL, an advanced object-relational database management system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 172.69 MB |
| Uncompressed | ~431.74 MB |

## Usage

```bash
# Build the image
nix build .#postgres

# Load into Docker
nix build .#load-postgres-to-docker && ./result/bin/load-postgres-to-docker
```
