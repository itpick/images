# crossplane-keycloak-fips

A Crossplane provider for Keycloak FIPS version

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-keycloak-fips

# Load into Docker
nix build .#load-crossplane-keycloak-fips-to-docker && ./result/bin/load-crossplane-keycloak-fips-to-docker
```
