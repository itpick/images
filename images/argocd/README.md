# argocd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#argocd

# Load into Docker
nix build .#load-argocd-to-docker && ./result/bin/load-argocd-to-docker
```
