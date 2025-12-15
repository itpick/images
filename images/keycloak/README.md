# keycloak

Minimalist Wolfi-based Keycloak image for identity and access management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#keycloak

# Load into Docker
nix build .#load-keycloak-to-docker && ./result/bin/load-keycloak-to-docker
```
