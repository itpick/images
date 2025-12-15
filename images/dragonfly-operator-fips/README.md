# dragonfly-operator-fips

A FIPS-compliant Kubernetes operator used to deploy and manage Dragonfly instances inside your Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dragonfly-operator-fips

# Load into Docker
nix build .#load-dragonfly-operator-fips-to-docker && ./result/bin/load-dragonfly-operator-fips-to-docker
```
