# kyverno-cli

Kyverno is a policy engine that allows you to write policies as Kubernetes resources and manage them with familiar tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#kyverno-cli

# Load into Docker
nix build .#load-kyverno-cli-to-docker && ./result/bin/load-kyverno-cli-to-docker
```
