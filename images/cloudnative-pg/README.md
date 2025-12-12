# cloudnative-pg

Minimal Wolfi-based image for CloudNative PG, a comprehensive platform designed to seamlessly manage PostgreSQL databases within Kubernetes environments

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 50s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 165.47 MB |
| Uncompressed | ~413.68 MB |

## Usage

```bash
# Build the image
nix build .#cloudnative-pg

# Load into Docker
nix build .#load-cloudnative-pg-to-docker && ./result/bin/load-cloudnative-pg-to-docker
```
