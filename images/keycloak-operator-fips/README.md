# keycloak-operator-fips

A Kubernetes Operator based on the Operator SDK for installing and managing Keycloak with FIPS support

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keycloak-operator-fips

# Load into Docker
nix build .#load-keycloak-operator-fips-to-docker && ./result/bin/load-keycloak-operator-fips-to-docker
```
