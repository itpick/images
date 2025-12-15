# postgres-operator

Creates and manages PostgreSQL clusters running in Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-operator

# Load into Docker
nix build .#load-postgres-operator-to-docker && ./result/bin/load-postgres-operator-to-docker
```
