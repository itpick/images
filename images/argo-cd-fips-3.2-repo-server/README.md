# argo-cd-fips-3.2-repo-server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-cd-fips-3.2-repo-server

# Load into Docker
nix build .#load-argo-cd-fips-3.2-repo-server-to-docker && ./result/bin/load-argo-cd-fips-3.2-repo-server-to-docker
```
