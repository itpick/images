# kyverno

Kyverno is a policy engine that allows you to write policies as Kubernetes resources and manage them with familiar tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 15s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 274.13 MB |
| Uncompressed | ~685.33 MB |

## Usage

```bash
# Build the image
nix build .#kyverno

# Load into Docker
nix build .#load-kyverno-to-docker && ./result/bin/load-kyverno-to-docker
```
