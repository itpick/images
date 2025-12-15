# argo-cd-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-cd-fips

# Load into Docker
nix build .#load-argo-cd-fips-to-docker && ./result/bin/load-argo-cd-fips-to-docker
```
