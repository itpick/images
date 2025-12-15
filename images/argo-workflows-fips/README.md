# argo-workflows-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-workflows-fips

# Load into Docker
nix build .#load-argo-workflows-fips-to-docker && ./result/bin/load-argo-workflows-fips-to-docker
```
