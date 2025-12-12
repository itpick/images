# kyverno-cleanup-controller

Kyverno is a policy engine that allows you to write policies as Kubernetes resources and manage them with familiar tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 5s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 258.13 MB |
| Uncompressed | ~645.33 MB |

## Usage

```bash
# Build the image
nix build .#kyverno-cleanup-controller

# Load into Docker
nix build .#load-kyverno-cleanup-controller-to-docker && ./result/bin/load-kyverno-cleanup-controller-to-docker
```
