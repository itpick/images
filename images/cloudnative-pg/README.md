# cloudnative-pg

Minimal Wolfi-based image for CloudNative PG, a comprehensive platform designed to seamlessly manage PostgreSQL databases within Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 50s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cloudnative-pg

# Load into Docker
nix build .#load-cloudnative-pg-to-docker && ./result/bin/load-cloudnative-pg-to-docker
```
