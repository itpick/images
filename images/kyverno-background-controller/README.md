# kyverno-background-controller

Kyverno is a policy engine that allows you to write policies as Kubernetes resources and manage them with familiar tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kyverno-background-controller

# Load into Docker
nix build .#load-kyverno-background-controller-to-docker && ./result/bin/load-kyverno-background-controller-to-docker
```
