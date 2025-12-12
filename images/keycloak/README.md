# keycloak

Minimalist Wolfi-based Keycloak image for identity and access management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 15s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 1.58 GB |
| Uncompressed | ~3.96 GB |

## Usage

```bash
# Build the image
nix build .#keycloak

# Load into Docker
nix build .#load-keycloak-to-docker && ./result/bin/load-keycloak-to-docker
```
