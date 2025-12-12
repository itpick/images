# flux-operator

Flux Operator is a Kubernetes controller for managing the lifecycle of Flux CD

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 136.34 MB |
| Uncompressed | ~340.85 MB |

## Usage

```bash
# Build the image
nix build .#flux-operator

# Load into Docker
nix build .#load-flux-operator-to-docker && ./result/bin/load-flux-operator-to-docker
```
