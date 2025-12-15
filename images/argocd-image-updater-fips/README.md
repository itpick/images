# argocd-image-updater-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argocd-image-updater-fips

# Load into Docker
nix build .#load-argocd-image-updater-fips-to-docker && ./result/bin/load-argocd-image-updater-fips-to-docker
```
