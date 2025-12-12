# kyverno-background-controller

Kyverno is a policy engine that allows you to write policies as Kubernetes resources and manage them with familiar tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 269.44 MB |
| Uncompressed | ~673.60 MB |

## Usage

```bash
# Build the image
nix build .#kyverno-background-controller

# Load into Docker
nix build .#load-kyverno-background-controller-to-docker && ./result/bin/load-kyverno-background-controller-to-docker
```
