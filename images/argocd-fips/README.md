# argocd-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argocd-fips

# Load into Docker
nix build .#load-argocd-fips-to-docker && ./result/bin/load-argocd-fips-to-docker
```
