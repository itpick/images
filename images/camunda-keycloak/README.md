# camunda-keycloak

Minimalist Wolfi-based Camunda Keycloak image for identity and access management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#camunda-keycloak

# Load into Docker
nix build .#load-camunda-keycloak-to-docker && ./result/bin/load-camunda-keycloak-to-docker
```
