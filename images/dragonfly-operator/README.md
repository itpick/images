# dragonfly-operator

Kubernetes operator used to deploy and manage Dragonfly instances inside your Kubernetes clusters

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 43s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 156.27 MB |
| Uncompressed | ~390.69 MB |

## Usage

```bash
# Build the image
nix build .#dragonfly-operator

# Load into Docker
nix build .#load-dragonfly-operator-to-docker && ./result/bin/load-dragonfly-operator-to-docker
```
