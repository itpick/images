# postgres-cloudnative-pg

Minimal Wolfi-based image for CloudNative PG, a comprehensive platform designed to seamlessly manage PostgreSQL databases within Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#postgres-cloudnative-pg

# Load into Docker
nix build .#load-postgres-cloudnative-pg-to-docker && ./result/bin/load-postgres-cloudnative-pg-to-docker
```
