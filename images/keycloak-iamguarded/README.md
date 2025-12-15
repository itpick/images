# keycloak-iamguarded

Minimalist Wolfi-based Keycloak IAMGuarded image for identity and access management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keycloak-iamguarded

# Load into Docker
nix build .#load-keycloak-iamguarded-to-docker && ./result/bin/load-keycloak-iamguarded-to-docker
```
