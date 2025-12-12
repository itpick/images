# kyvernopre

Kyverno is a policy engine that allows you to write policies as Kubernetes resources and manage them with familiar tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 0s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 253.65 MB |
| Uncompressed | ~634.13 MB |

## Usage

```bash
# Build the image
nix build .#kyvernopre

# Load into Docker
nix build .#load-kyvernopre-to-docker && ./result/bin/load-kyvernopre-to-docker
```
