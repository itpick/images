# argo-rollouts-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-rollouts-fips

# Load into Docker
nix build .#load-argo-rollouts-fips-to-docker && ./result/bin/load-argo-rollouts-fips-to-docker
```
