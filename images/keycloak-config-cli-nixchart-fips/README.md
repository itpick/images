# keycloak-config-cli-nixchart-fips

Import YAML/JSON-formatted configuration files into Keycloak - Configuration as Code for Keycloak

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keycloak-config-cli-nixchart-fips

# Load into Docker
nix build .#load-keycloak-config-cli-nixchart-fips-to-docker && ./result/bin/load-keycloak-config-cli-nixchart-fips-to-docker
```
