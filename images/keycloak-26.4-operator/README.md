# keycloak-26.4-operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#keycloak-26.4-operator

# Load into Docker
nix build .#load-keycloak-26.4-operator-to-docker && ./result/bin/load-keycloak-26.4-operator-to-docker
```
