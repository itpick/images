# argocd-image-updater

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argocd-image-updater

# Load into Docker
nix build .#load-argocd-image-updater-to-docker && ./result/bin/load-argocd-image-updater-to-docker
```
