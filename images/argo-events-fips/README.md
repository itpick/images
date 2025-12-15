# argo-events-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#argo-events-fips

# Load into Docker
nix build .#load-argo-events-fips-to-docker && ./result/bin/load-argo-events-fips-to-docker
```
