# kaniko

Build Container Images In Kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kaniko

# Load into Docker
nix build .#load-kaniko-to-docker && ./result/bin/load-kaniko-to-docker
```
