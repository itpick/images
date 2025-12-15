# crossplane-keycloak

A Crossplane provider for Keycloak

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-keycloak

# Load into Docker
nix build .#load-crossplane-keycloak-to-docker && ./result/bin/load-crossplane-keycloak-to-docker
```
