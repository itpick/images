# kyverno-cleanup-controller

Kyverno is a policy engine that allows you to write policies as Kubernetes resources and manage them with familiar tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 1s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kyverno-cleanup-controller

# Load into Docker
nix build .#load-kyverno-cleanup-controller-to-docker && ./result/bin/load-kyverno-cleanup-controller-to-docker
```
