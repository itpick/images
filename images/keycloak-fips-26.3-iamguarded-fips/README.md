# keycloak-fips-26.3-iamguarded-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keycloak-fips-26.3-iamguarded-fips

# Load into Docker
nix build .#load-keycloak-fips-26.3-iamguarded-fips-to-docker && ./result/bin/load-keycloak-fips-26.3-iamguarded-fips-to-docker
```
