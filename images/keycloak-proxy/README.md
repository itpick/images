# keycloak-proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 802.65 MB |
| Uncompressed | ~1.95 GB |

## Usage

```bash
# Build the image
nix build .#keycloak-proxy

# Load into Docker
nix build .#load-keycloak-proxy-to-docker && ./result/bin/load-keycloak-proxy-to-docker
```
