# argocd-repo-server-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argocd-repo-server-fips

# Load into Docker
nix build .#load-argocd-repo-server-fips-to-docker && ./result/bin/load-argocd-repo-server-fips-to-docker
```
