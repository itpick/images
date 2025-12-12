# kyverno-reports-controller

Kyverno is a policy engine that allows you to write policies as Kubernetes resources and manage them with familiar tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1m 52s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 268.18 MB |
| Uncompressed | ~670.46 MB |

## Usage

```bash
# Build the image
nix build .#kyverno-reports-controller

# Load into Docker
nix build .#load-kyverno-reports-controller-to-docker && ./result/bin/load-kyverno-reports-controller-to-docker
```
