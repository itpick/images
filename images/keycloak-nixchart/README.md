# keycloak-nixchart

Minimalist Wolfi-based Keycloak IAMGuarded image for identity and access management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keycloak-nixchart

# Load into Docker
nix build .#load-keycloak-nixchart-to-docker && ./result/bin/load-keycloak-nixchart-to-docker
```
