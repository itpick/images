# keycloak-proxy

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#keycloak-proxy

# Load into Docker
nix build .#load-keycloak-proxy-to-docker && ./result/bin/load-keycloak-proxy-to-docker
```
