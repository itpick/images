# argocd-repo-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argocd-repo-server

# Load into Docker
nix build .#load-argocd-repo-server-to-docker && ./result/bin/load-argocd-repo-server-to-docker
```
