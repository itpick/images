# postgres-repmgr-iamguarded

PostgreSQL HA, a cluster solution using the PostgreSQL replication manager

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-repmgr-iamguarded

# Load into Docker
nix build .#load-postgres-repmgr-iamguarded-to-docker && ./result/bin/load-postgres-repmgr-iamguarded-to-docker
```
