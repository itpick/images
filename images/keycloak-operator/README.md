# keycloak-operator

A Kubernetes Operator based on the Operator SDK for installing and managing Keycloak

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keycloak-operator

# Load into Docker
nix build .#load-keycloak-operator-to-docker && ./result/bin/load-keycloak-operator-to-docker
```
