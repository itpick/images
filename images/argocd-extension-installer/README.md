# argocd-extension-installer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#argocd-extension-installer

# Load into Docker
nix build .#load-argocd-extension-installer-to-docker && ./result/bin/load-argocd-extension-installer-to-docker
```
