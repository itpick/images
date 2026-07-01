# keycloak-config-cli-nixchart

Import YAML/JSON-formatted configuration files into Keycloak - Configuration as Code for Keycloak

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keycloak-config-cli-nixchart

# Load into Docker
nix build .#load-keycloak-config-cli-nixchart-to-docker && ./result/bin/load-keycloak-config-cli-nixchart-to-docker
```
