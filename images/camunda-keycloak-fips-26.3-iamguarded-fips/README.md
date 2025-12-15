# camunda-keycloak-fips-26.3-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#camunda-keycloak-fips-26.3-iamguarded-fips

# Load into Docker
nix build .#load-camunda-keycloak-fips-26.3-iamguarded-fips-to-docker && ./result/bin/load-camunda-keycloak-fips-26.3-iamguarded-fips-to-docker
```
