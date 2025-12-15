# fluxcd-kustomize-mutating-webhook

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluxcd-kustomize-mutating-webhook

# Load into Docker
nix build .#load-fluxcd-kustomize-mutating-webhook-to-docker && ./result/bin/load-fluxcd-kustomize-mutating-webhook-to-docker
```
