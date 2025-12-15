# crossplane-provider-keycloak-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-provider-keycloak-fips

# Load into Docker
nix build .#load-crossplane-provider-keycloak-fips-to-docker && ./result/bin/load-crossplane-provider-keycloak-fips-to-docker
```
