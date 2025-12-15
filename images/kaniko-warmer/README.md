# kaniko-warmer

Build Container Images In Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kaniko-warmer

# Load into Docker
nix build .#load-kaniko-warmer-to-docker && ./result/bin/load-kaniko-warmer-to-docker
```
