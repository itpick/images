# flux-operator-fips

Flux Operator is a Kubernetes controller for managing the lifecycle of Flux CD

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#flux-operator-fips

# Load into Docker
nix build .#load-flux-operator-fips-to-docker && ./result/bin/load-flux-operator-fips-to-docker
```
