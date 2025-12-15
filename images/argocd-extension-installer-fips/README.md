# argocd-extension-installer-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argocd-extension-installer-fips

# Load into Docker
nix build .#load-argocd-extension-installer-fips-to-docker && ./result/bin/load-argocd-extension-installer-fips-to-docker
```
