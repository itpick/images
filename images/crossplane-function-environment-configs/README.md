# crossplane-function-environment-configs

Crossplane function that manages environment-specific configurations for resources in compositions

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#crossplane-function-environment-configs

# Load into Docker
nix build .#load-crossplane-function-environment-configs-to-docker && ./result/bin/load-crossplane-function-environment-configs-to-docker
```
