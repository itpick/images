# postgres-iamguarded

PostgreSQL is a powerful, open source object-relational database system

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-iamguarded

# Load into Docker
nix build .#load-postgres-iamguarded-to-docker && ./result/bin/load-postgres-iamguarded-to-docker
```
