# pgadmin4

pgAdmin is an open source administration and development platform for PostgreSQL

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pgadmin4

# Load into Docker
nix build .#load-pgadmin4-to-docker && ./result/bin/load-pgadmin4-to-docker
```
