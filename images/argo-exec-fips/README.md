# argo-exec-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-exec-fips

# Load into Docker
nix build .#load-argo-exec-fips-to-docker && ./result/bin/load-argo-exec-fips-to-docker
```
